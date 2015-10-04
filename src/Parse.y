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
    '('     { TokOpen   }
    ')'     { TokClose  }
    '->'    { TokArrow  }
    VAR     { TokVar $$ }
    TYPE    { TokType   }
    DEF     { TokDef    }
    LET     { TokLet    }
    IN      { TokIn     }
    AS      { TokAs     }


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
        : '\\' VAR ':' Type '.' Exp       { Abs $2 $4 $6 }
        | NAbs                            { $1 }
        | LET VAR '=' Exp IN Exp          { Let $2 $4 $6 }
        | Exp AS Type                     { As $3 $1 }

NAbs    :: { LamTerm }
        : NAbs Atom                       { App $1 $2 }
        | Atom                            { $1 }

Atom    :: { LamTerm }
        : VAR                             { LVar $1 }
        | '(' Exp ')'                     { $2 }

Type    : TYPE                            { Base }
        | Type '->' Type                  { Fun $1 $3 }
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
           | TokType
           | TokDef
           | TokAbs
           | TokDot
           | TokOpen
           | TokClose
           | TokColon
           | TokArrow
           | TokEquals
           | TokEOF
           | TokLet
           | TokIn
           | TokAs
           deriving Show

----------------------------------
lexer cont s =
    case s of
        []                 -> cont TokEOF []
        ('\n':s)           -> \line -> lexer cont s (line + 1)
        (c:cs) | isSpace c -> lexer cont cs
               | isAlpha c -> lexVar (c:cs)
        ('-':('>':cs))     -> cont TokArrow  cs
        ('\\':cs)          -> cont TokAbs    cs
        ('.':cs)           -> cont TokDot    cs
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
                   ("B",   rest) -> cont TokType      rest
                   ("def", rest) -> cont TokDef       rest
                   ("let", rest) -> cont TokLet       rest
                   ("in",  rest) -> cont TokIn        rest
                   ("as",  rest) -> cont TokAs        rest
                   (var,   rest) -> cont (TokVar var) rest
         consumirBK anidado cl cont s =
             case s of
                ('-':('-':cs)) -> consumirBK anidado cl cont $ dropWhile ((/=) '\n') cs
                ('{':('-':cs)) -> consumirBK (anidado+1) cl cont cs
                ('-':('}':cs)) -> case anidado of
                                         0 -> \line -> lexer cont cs (line+cl)
                                         _ -> consumirBK (anidado-1) cl cont cs
                ('\n':cs) -> consumirBK anidado (cl+1) cont cs
                (_:cs) -> consumirBK anidado cl cont cs

stmts_parse s = parseStmts s 1
stmt_parse s  = parseStmt s 1
term_parse s  = term s 1
}
