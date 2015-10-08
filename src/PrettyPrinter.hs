module PrettyPrinter (
          printTerm,     -- pretty printer para terminos
          printType,     -- pretty printer para tipos
       ) where

import Common
import Text.PrettyPrint.HughesPJ

-- lista de posibles nombres para variables
vars :: [String]
vars = [ c : n | n <- "" : map show [1..], c <- "xyz" ++ ['a'..'w'] ]

parensIf :: Bool -> Doc -> Doc
parensIf True  = parens
parensIf False = id

-- pretty-printer de términos
pp :: Int -> [String] -> Term -> Doc
pp ii vs (TBound k)         = text (vs !! (ii - k - 1))
pp _  _  (TFree (Global s)) = text s
pp ii vs (i :@: c)          = sep [parensIf (isLam i) (pp ii vs i),
                                  nest 1 (parensIf (isLam c || isApp c) (pp ii vs c))]
pp ii vs (TLam t c)         = text "\\" <> text (vs !! ii) <> text ":" <>
                                  printType t <> text ". " <> pp (ii+1) vs c
pp ii vs (TLet u v)         = text "let " <> text (vs !! ii) <> text " = " <>
                                  pp (ii+1) vs u <> text " in " <> pp (ii+1) vs v
pp ii vs (TAs t u)          = pp ii vs u <> text " as " <> printType t
pp _  _  TUnit              = text "unit"
pp ii vs (TTup u v)         = text "(" <> pp ii vs u <> text ", "
                                       <> pp ii vs v <> text ")"
pp ii vs (TFst u)           = text "fst " <> pp ii vs u
pp ii vs (TSnd u)           = text "snd " <> pp ii vs u
pp ii vs TZero              = integer 0
pp ii vs (TSuc u)           = text "suc " <> parensIf (not $ isAtom u) (pp ii vs u)
pp ii vs (TRec u v w)       = text "R " <> sep [parensIf (not $ isAtom u) (pp ii vs u),
                                                parensIf (not $ isAtom v) (pp ii vs v),
                                                parensIf (not $ isAtom w) (pp ii vs w)]


isAtom TUnit      = True
isAtom TZero      = True
isAtom (TBound _) = True
isAtom (TFree  _) = True
isAtom (TTup _ _) = True
isAtom _          = False

isLam (TLam _ _) = True
isLam  _         = False

isApp (_ :@: _)  = True
isApp _          = False


-- pretty-printer de tipos
printType :: Type -> Doc
printType BaseT         = text "B"
printType UnitT         = text "Unit"
printType (TupT t1 t2)  = text "(" <> printType t1 <> text ", "
                                   <> printType t2 <> text ")"
printType (FunT t1 t2)  = sep [parensIf (isFun t1) (printType t1),
                               text "->", printType t2]
                                where isFun (FunT _ _) = True
                                      isFun _          = False
printType NatT          = text "Nat"


fv :: Term -> [String]
fv TUnit              = []
fv (TFree (Global n)) = [n]
fv (TFree _)          = []
fv (TBound _)         = []
fv (TLam _ u)         = fv u
fv (u :@: v)          = fv u ++ fv v
fv (TLet u v)         = fv u ++ fv v
fv (TAs t u)          = fv u
fv (TTup u v)         = fv u ++ fv v
fv (TFst u)           = fv u
fv (TSnd u)           = fv u
fv TZero              = []
fv (TSuc u)           = fv u
fv (TRec u v w)       = fv u ++ fv v ++ fv w

---
printTerm :: Term -> Doc
printTerm t = pp 0 (filter (\v -> v `notElem` fv t) vars) t
