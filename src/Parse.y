{
module Parse where

import Common
import Data.Maybe
import Data.Char
}

%monad { P } { thenP } { returnP }
%name parseStmt  Def
%name parseStmts Defs
%name term       Exp

%tokentype     { Token }
%lexer {lexer} { TokEOF  }

%token
    '='     { TokEquals }
    ':'     { TokColon  }
    '\\'    { TokAbs    }
    '.'     { TokDot    }
    ','     { TokComma  }
    '('     { TokOpen   }
    ')'     { TokClose  }
    '->'    { TokArrow  }
    VAR     { TokVar $$ }
    BASET   { TokBaseT  }
    DEF     { TokDef    }
    LET     { TokLet    }
    IN      { TokIn     }
    AS      { TokAs     }
    UNIT    { TokUnit   }
    UNITT   { TokUnitT  }
    FST     { TokFst    }
    SND     { TokSnd    }
    NATT    { TokNatT   }
    ZERO    { TokZero   }
    SUC     { TokSuc    }
    REC     { TokRec    }
    NUM     { TokNum $$ }


%right VAR
%left '='
%right '->'
%right '\\' '.' LET IN
%left AS
%right REC
%right SUC
%right SND FST

%%

Def     :  Defexp                         { $1 }
        |  Exp                            { Eval $1 }

Defexp  : DEF VAR '=' Exp                 { Def $2 $4 }

Exp     :: { LamTerm }
        : NAbs                            { $1 }
        | '\\' VAR ':' Type '.' Exp       { Abs $2 $4 $6 }
        | LET VAR '=' Exp IN Exp          { Let $2 $4 $6 }
        | Exp AS Type                     { As $3 $1 }
        | FST Atom                        { Fst $2 }
        | SND Atom                        { Snd $2 }
        | SUC Atom                        { Suc $2 }
        | REC Atom Atom Exp               { Rec $2 $3 $4 }

NAbs    :: { LamTerm }
        : NAbs Atom                       { App $1 $2 }
        | Atom                            { $1 }

Atom    :: { LamTerm }
        : VAR                             { LVar $1 }
        | UNIT                            { Unit }
        | NUM                             { numToLam (read $1) }
        | ZERO                            { Zero }
        | '(' Exp ')'                     { $2 }
        | '(' Exp ',' Exp ')'             { Tup $2 $4 }

Type    : BASET                           { BaseT }
        | UNITT                           { UnitT }
        | NATT                            { NatT }
        | Type '->' Type                  { FunT $1 $3 }
        | '(' Type ',' Type')'            { TupT $2 $4 }
        | '(' Type ')'                    { $2 }

Defs    : Defexp Defs                     { $1 : $2 }
        |                                 { [] }


{
data ParseResult a = Ok a
                   | Failed String
                   deriving Show

type LineNumber = Int
type P a = String -> LineNumber -> ParseResult a

getLineNo :: P LineNumber
getLineNo = \s l -> Ok l

thenP :: P a -> (a -> P b) -> P b
m `thenP` k = \s l-> case m s l of
                         Ok a     -> k a s l
                         Failed e -> Failed e

returnP :: a -> P a
returnP a = \s l -> Ok a

failP :: String -> P a
failP err = \s l -> Failed err

catchP :: P a -> (String -> P a) -> P a
catchP m k = \s l -> case m s l of
                        Ok a     -> Ok a
                        Failed e -> k e s l

happyError :: P a
happyError = \s i -> Failed $ "Linea " ++ (show (i::LineNumber)) ++ ": Error de parseo \n" ++ (s)

data Token = TokVar String
           | TokNum String
           | TokBaseT
           | TokDef
           | TokAbs
           | TokDot
           | TokComma
           | TokOpen
           | TokClose
           | TokColon
           | TokArrow
           | TokEquals
           | TokEOF
           | TokLet
           | TokIn
           | TokAs
           | TokUnit
           | TokUnitT
           | TokFst
           | TokSnd
           | TokNatT
           | TokZero
           | TokSuc
           | TokRec
           deriving Show

----------------------------------
lexer cont s =
    case s of
        []                 -> cont TokEOF []
        ('\n':s)           -> \line -> lexer cont s (line + 1)
        (c:cs) | isSpace c -> lexer cont cs
               | isAlpha c -> lexVar   (c:cs)
               | isDigit c -> lexDigit (c:cs)
        ('-':('>':cs))     -> cont TokArrow  cs
        ('\\':cs)          -> cont TokAbs    cs
        ('.':cs)           -> cont TokDot    cs
        (',':cs)           -> cont TokComma  cs
        ('(':cs)           -> cont TokOpen   cs
        ('-':('>':cs))     -> cont TokArrow  cs
        (')':cs)           -> cont TokClose  cs
        (':':cs)           -> cont TokColon  cs
        ('=':cs)           -> cont TokEquals cs
        ('-':('-':cs))     -> lexer cont $ dropWhile ((/=) '\n') cs
        ('{':('-':cs))     -> consumirBK 0 0 cont cs
        ('-':('}':cs))     -> \line -> Failed $ "Linea " ++ (show line) ++ ": Comentario no abierto"
        unknown            -> \line -> Failed $ "Linea " ++ (show line) ++ ": No se puede reconocer "
                                                         ++ (show $ take 10 unknown) ++ "..."
    where
         lexVar cs =
             case span isAlpha cs of
                ("def",  rest) -> cont TokDef       rest
                ("let",  rest) -> cont TokLet       rest
                ("in",   rest) -> cont TokIn        rest
                ("as",   rest) -> cont TokAs        rest
                ("B",    rest) -> cont TokBaseT     rest
                ("Unit", rest) -> cont TokUnitT     rest
                ("unit", rest) -> cont TokUnit      rest
                ("fst",  rest) -> cont TokFst       rest
                ("snd",  rest) -> cont TokSnd       rest
                ("Nat", rest)  -> cont TokNatT      rest
                ("suc",  rest) -> cont TokSuc       rest
                ("R",    rest) -> cont TokRec       rest
                (var,    rest) -> cont (TokVar var) rest
         lexDigit cs = let (n, rest) = span isDigit cs
                       in cont (TokNum n) rest
         consumirBK anidado cl cont s =
             case s of
                ('-':('-':cs)) -> consumirBK anidado cl cont $ dropWhile ((/=) '\n') cs
                ('{':('-':cs)) -> consumirBK (anidado+1) cl cont cs
                ('-':('}':cs)) -> case anidado of
                                         0 -> \line -> lexer cont cs (line+cl)
                                         _ -> consumirBK (anidado-1) cl cont cs
                ('\n':cs) -> consumirBK anidado (cl+1) cont cs
                (_:cs) -> consumirBK anidado cl cont cs

numToLam 0 = Zero
numToLam n = Suc (numToLam (n-1))

stmts_parse s = parseStmts s 1
stmt_parse s  = parseStmt s 1
term_parse s  = term s 1
}
