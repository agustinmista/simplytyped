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
pp ii vs (Bound k)         = text (vs !! (ii - k - 1))
pp _  _  (Free (Global s)) = text s
pp ii vs (i :@: c)         = sep [parensIf (isLam i) (pp ii vs i),
                                 nest 1 (parensIf (isLam c || isApp c) (pp ii vs c))]
pp ii vs (Lam t c)         = text "\\" <> text (vs !! ii) <> text ":" <>
                                 printType t <> text ". " <> pp (ii+1) vs c
pp ii vs (TLet u v)        = text "let " <> text (vs !! ii) <> text " = " <>
                                 pp (ii+1) vs u <> text " in " <> pp (ii+1) vs v
pp ii vs (TAs t u)         = pp ii vs u <> text " as " <> printType t

isLam (Lam _ _) = True
isLam  _        = False

isApp (_ :@: _) = True
isApp _         = False

-- pretty-printer de tipos
printType :: Type -> Doc
printType Base         = text "B"
printType (Fun t1 t2)  = sep [ parensIf (isFun t1) (printType t1),
                               text "->", printType t2 ]
                                where isFun (Fun _ _)        = True
                                      isFun _                = False

fv :: Term -> [String]
fv (Free (Global n)) = [n]
fv (Free _)          = []
fv (Bound _)         = []
fv (Lam _ u)         = fv u
fv (t :@: u)         = fv t ++ fv u
fv (TLet u v)        = fv u ++ fv v
fv (TAs t u)         = fv u

---
printTerm :: Term -> Doc
printTerm t = pp 0 (filter (\v -> v `notElem` fv t) vars) t
