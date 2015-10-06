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


-----------------------
--- eval
-----------------------

sub :: Int -> Term -> Term -> Term
sub _ _ TUnit      = TUnit
sub _ _ (TFree n)   = TFree n
sub i t (TBound j)  = if i == j then t else TBound j
sub i t (u :@: v)  = sub i t u :@: sub i t v
sub i t (TLam t' u) = TLam t' (sub (i+1) t u)
sub i t (TLet u v) = TLet (sub i t u) (sub (i+1) t v)
sub i t (TAs t' u) = TAs t' (sub i t u)


-- evaluador de términos
eval :: NameEnv Value Type -> Term -> Value
eval _ TUnit                 = VUnit
eval _ (TBound _)             = error "variable ligada inesperada en eval"
eval e (TFree n)              = fst $ fromJust $ lookup n e
eval _ (TLam t u)             = VLam t u
eval e (TLam _ u :@: TLam s v) = eval e (sub 0 (TLam s v) u)
eval e (TLam t u :@: v)       = case eval e v of
                                  v'@(VLam _ _) -> eval e (TLam t u :@: (quote v'))
                                  v'@VUnit      -> eval e (sub 0 (quote v') u)
eval e (u :@: v)             = let u' = eval e u in eval e (sub 0 (quote u') v)
eval e (TLet u v)            = let u' = eval e u in eval e (sub 0 (quote u') v)
eval e (TAs t u)             = eval e u

-----------------------
--- quoting
-----------------------

quote :: Value -> Term
quote VUnit      = TUnit
quote (VLam t f) = TLam t f

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

notfoundError :: Name -> Either String Type
notfoundError n = err $ show n ++ " no está definida."

----------------------------------
