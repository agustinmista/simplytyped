module Simplytyped (
           conversion,    -- conversion a terminos localmente sin nombre
           eval,          -- evaluador
           infer,         -- inferidor de tipos
           quote          -- valores -> terminos
       ) where

import Common
import Data.List
import Data.Maybe
import Prelude hiding ((>>=))
import PrettyPrinter
import Text.PrettyPrint.HughesPJ (render)

-- conversion a términos localmente sin nombres
conversion :: LamTerm -> Term
conversion = conversion' []

conversion' :: [String] -> LamTerm -> Term
conversion' b Unit        = TUnit
conversion' b (LVar n)    = maybe (TFree (Global n)) TBound (n `elemIndex` b)
conversion' b (App t u)   = conversion' b t :@: conversion' b u
conversion' b (Abs n t u) = TLam t (conversion' (n:b) u)
conversion' b (Let x u v) = TLet (conversion' b u) (conversion' (x:b) v)
conversion' b (As t u)    = TAs t (conversion' b u)
conversion' b (Tup u v)   = TTup (conversion' b u) (conversion' b v)
conversion' b (Fst u)     = TFst (conversion' b u)
conversion' b (Snd u)     = TSnd (conversion' b u)


-----------------------
--- eval
-----------------------

-- substitucion de términos
sub :: Int -> Term -> Term -> Term
sub i t (TBound j)  = if i == j then t else TBound j
sub _ _ TUnit       = TUnit
sub _ _ (TFree n)   = TFree n
sub i t (u :@: v)   = sub i t u :@: sub i t v
sub i t (TLam t' u) = TLam t' (sub (i+1) t u)
sub i t (TLet u v)  = TLet (sub i t u) (sub (i+1) t v)
sub i t (TAs t' u)  = TAs t' (sub i t u)
sub i t (TTup u v)  = TTup (sub i t u) (sub i t v)
sub i t (TFst u)    = TFst (sub i t u)
sub i t (TSnd u)    = TSnd (sub i t u)


-- evaluador de términos
eval :: NameEnv Value Type -> Term -> Value
eval _ TUnit                   = VUnit
eval _ (TBound _)              = error "variable ligada inesperada en eval"
eval e (TFree n)               = fst $ fromJust $ lookup n e
eval _ (TLam t u)              = VLam t u
eval e (TLam _ u :@: TLam s v) = eval e (sub 0 (TLam s v) u)
eval e (TLam t u :@: v)        = case eval e v of
                                    v'@(VLam t' u') -> eval e (TLam t u :@: (quote v'))
                                    v'              -> eval e (sub 0 (quote v') u)
eval e (u :@: v)               = let u' = eval e u in eval e (sub 0 (quote u') v)
eval e (TLet u v)              = let u' = eval e u in eval e (sub 0 (quote u') v)
eval e (TAs t u)               = eval e u
eval e (TTup u v)              = let u' = eval e u in VTup u' (eval e v)
eval e (TFst u)                = case eval e u of
                                    (VTup v1 v2) -> v1
                                    _            -> error "Error de tipo en run-time, verificar type checker"
eval e (TSnd u)                = case eval e u of
                                    (VTup v1 v2) -> v2
                                    _            -> error "Error de tipo en run-time, verificar type checker"

-----------------------
--- quoting
-----------------------

quote :: Value -> Term
quote VUnit      = TUnit
quote (VLam t f) = TLam t f
quote (VTup u v) = TTup (quote u) (quote v)

----------------------
--- type checker
-----------------------

-- type checker
infer :: NameEnv Value Type -> Term -> Either String Type
infer = infer' []

infer' :: Context -> NameEnv Value Type -> Term -> Either String Type
infer' _ _ TUnit       = ret UnitT
infer' c _ (TBound i)   = ret (c !! i)
infer' _ e (TFree n)    = case lookup n e of
                            Nothing    -> notfoundError n
                            Just (_,t) -> ret t
infer' c e (t :@: u)    = do tt <- infer' c e t
                             tu <- infer' c e u
                             case tt of
                                FunT t1 t2 -> if tu == t1
                                             then ret t2
                                             else matchError t1 tu
                                _         -> notfunError tt
infer' c e (TLam t u)    = do tu <- infer' (t:c) e u
                              ret $ FunT t tu
infer' c e (TLet u v)   = do tu <- infer' c e u
                             infer' (tu:c) e v
infer' c e (TAs t u)    = do tu <- infer' c e u
                             if t == tu then ret tu else matchError t tu
infer' c e (TTup u v)   = do tu <- infer' c e u
                             tv <- infer' c e v
                             ret $ TupT tu tv
infer' c e (TFst u)     = do tu <- infer' c e u
                             case tu of
                                (TupT tu tv) -> ret tu
                                t            -> nottupError t
infer' c e (TSnd u)     = do tu <- infer' c e u
                             case tu of
                                (TupT tu tv) -> ret tv
                                t            -> nottupError t

-- definiciones auxiliares
ret :: Type -> Either String Type
ret = Right

err :: String -> Either String Type
err = Left

(>>=) :: Either String Type -> (Type -> Either String Type) -> Either String Type
(>>=) v f = either Left f v

-- fcs. de error
matchError :: Type -> Type -> Either String Type
matchError t1 t2 = err $ "se esperaba " ++ render (printType t1) ++
                         ", pero "      ++ render (printType t2) ++
                         " fue inferido."

notfunError :: Type -> Either String Type
notfunError t1 = err $ render (printType t1) ++ " no puede ser aplicado."

nottupError :: Type -> Either String Type
nottupError t = err $ "se esperaba (a, b), pero " ++ render (printType t) ++
                      " fue inferido."

notfoundError :: Name -> Either String Type
notfoundError n = err $ show n ++ " no está definida."

----------------------------------
