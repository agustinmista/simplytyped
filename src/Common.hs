module Common where

  -- Comandos interactivos o de archivos
  data Stmt i = Def String i    --  Declarar un nuevo identificador x, let x = t
              | Eval i          --  Evaluar el término
              deriving (Show)

  instance Functor Stmt where
    fmap f (Def s i) = Def s (f i)
    fmap f (Eval i)  = Eval (f i)

  -- Tipos de los nombres
  data Name = Global  String
            | Quote   Int
            deriving (Show, Eq)

  -- Entornos
  type NameEnv v t = [(Name, (v, t))]

  -- Tipo de los tipos
  data Type = BaseT
            | UnitT
            | TupT  Type  Type
            | FunT  Type  Type
            deriving (Show, Eq)

  -- Términos con nombres
  data LamTerm  =  Unit
                |  LVar String
                |  App  LamTerm  LamTerm
                |  Abs  String   Type     LamTerm
                |  Let  String   LamTerm  LamTerm
                |  As   Type     LamTerm
                |  Tup  LamTerm  LamTerm
                |  Fst  LamTerm
                |  Snd  LamTerm
                deriving (Show, Eq)

  -- Términos localmente sin nombres
  data Term  = TUnit
             | TBound Int
             | TFree  Name
             | Term   :@:   Term
             | TLam   Type  Term
             | TLet   Term  Term
             | TAs    Type  Term
             | TTup   Term  Term
             | TFst   Term
             | TSnd   Term
             deriving (Show, Eq)

  -- Valores
  data Value = VUnit
             | VLam  Type  Term
             | VTup  Value Value

  -- Contextos del tipado
  type Context = [Type]
