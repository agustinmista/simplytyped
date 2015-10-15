{-# OPTIONS_GHC -w #-}
module Parse where

import Common
import Data.Maybe
import Data.Char
import Control.Applicative(Applicative(..))

-- parser produced by Happy Version 1.19.4

data HappyAbsSyn t6 t7 t11 t12
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 (LamTerm)
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12

action_0 (15) = happyShift action_9
action_0 (18) = happyShift action_10
action_0 (21) = happyShift action_11
action_0 (23) = happyShift action_5
action_0 (24) = happyShift action_12
action_0 (27) = happyShift action_13
action_0 (29) = happyShift action_14
action_0 (30) = happyShift action_15
action_0 (32) = happyShift action_16
action_0 (33) = happyShift action_17
action_0 (34) = happyShift action_18
action_0 (35) = happyShift action_19
action_0 (6) = happyGoto action_22
action_0 (7) = happyGoto action_4
action_0 (8) = happyGoto action_23
action_0 (9) = happyGoto action_7
action_0 (10) = happyGoto action_8
action_0 _ = happyFail

action_1 (23) = happyShift action_5
action_1 (7) = happyGoto action_20
action_1 (12) = happyGoto action_21
action_1 _ = happyReduce_29

action_2 (15) = happyShift action_9
action_2 (18) = happyShift action_10
action_2 (21) = happyShift action_11
action_2 (24) = happyShift action_12
action_2 (27) = happyShift action_13
action_2 (29) = happyShift action_14
action_2 (30) = happyShift action_15
action_2 (32) = happyShift action_16
action_2 (33) = happyShift action_17
action_2 (34) = happyShift action_18
action_2 (35) = happyShift action_19
action_2 (8) = happyGoto action_6
action_2 (9) = happyGoto action_7
action_2 (10) = happyGoto action_8
action_2 _ = happyFail

action_3 (23) = happyShift action_5
action_3 (7) = happyGoto action_4
action_3 _ = happyFail

action_4 _ = happyReduce_3

action_5 (21) = happyShift action_34
action_5 _ = happyFail

action_6 (26) = happyShift action_24
action_6 (36) = happyAccept
action_6 _ = happyFail

action_7 (18) = happyShift action_10
action_7 (21) = happyShift action_11
action_7 (27) = happyShift action_13
action_7 (32) = happyShift action_16
action_7 (35) = happyShift action_19
action_7 (10) = happyGoto action_33
action_7 _ = happyReduce_6

action_8 _ = happyReduce_15

action_9 (21) = happyShift action_32
action_9 _ = happyFail

action_10 (15) = happyShift action_9
action_10 (18) = happyShift action_10
action_10 (21) = happyShift action_11
action_10 (24) = happyShift action_12
action_10 (27) = happyShift action_13
action_10 (29) = happyShift action_14
action_10 (30) = happyShift action_15
action_10 (32) = happyShift action_16
action_10 (33) = happyShift action_17
action_10 (34) = happyShift action_18
action_10 (35) = happyShift action_19
action_10 (8) = happyGoto action_31
action_10 (9) = happyGoto action_7
action_10 (10) = happyGoto action_8
action_10 _ = happyFail

action_11 _ = happyReduce_16

action_12 (21) = happyShift action_30
action_12 _ = happyFail

action_13 _ = happyReduce_17

action_14 (18) = happyShift action_10
action_14 (21) = happyShift action_11
action_14 (27) = happyShift action_13
action_14 (32) = happyShift action_16
action_14 (35) = happyShift action_19
action_14 (10) = happyGoto action_29
action_14 _ = happyFail

action_15 (18) = happyShift action_10
action_15 (21) = happyShift action_11
action_15 (27) = happyShift action_13
action_15 (32) = happyShift action_16
action_15 (35) = happyShift action_19
action_15 (10) = happyGoto action_28
action_15 _ = happyFail

action_16 _ = happyReduce_19

action_17 (18) = happyShift action_10
action_17 (21) = happyShift action_11
action_17 (27) = happyShift action_13
action_17 (32) = happyShift action_16
action_17 (35) = happyShift action_19
action_17 (10) = happyGoto action_27
action_17 _ = happyFail

action_18 (18) = happyShift action_10
action_18 (21) = happyShift action_11
action_18 (27) = happyShift action_13
action_18 (32) = happyShift action_16
action_18 (35) = happyShift action_19
action_18 (10) = happyGoto action_26
action_18 _ = happyFail

action_19 _ = happyReduce_18

action_20 (23) = happyShift action_5
action_20 (7) = happyGoto action_20
action_20 (12) = happyGoto action_25
action_20 _ = happyReduce_29

action_21 (36) = happyAccept
action_21 _ = happyFail

action_22 (36) = happyAccept
action_22 _ = happyFail

action_23 (26) = happyShift action_24
action_23 _ = happyReduce_4

action_24 (18) = happyShift action_42
action_24 (22) = happyShift action_43
action_24 (28) = happyShift action_44
action_24 (31) = happyShift action_45
action_24 (11) = happyGoto action_41
action_24 _ = happyFail

action_25 _ = happyReduce_28

action_26 (18) = happyShift action_10
action_26 (21) = happyShift action_11
action_26 (27) = happyShift action_13
action_26 (32) = happyShift action_16
action_26 (35) = happyShift action_19
action_26 (10) = happyGoto action_40
action_26 _ = happyFail

action_27 _ = happyReduce_12

action_28 _ = happyReduce_11

action_29 _ = happyReduce_10

action_30 (13) = happyShift action_39
action_30 _ = happyFail

action_31 (17) = happyShift action_37
action_31 (19) = happyShift action_38
action_31 (26) = happyShift action_24
action_31 _ = happyFail

action_32 (14) = happyShift action_36
action_32 _ = happyFail

action_33 _ = happyReduce_14

action_34 (13) = happyShift action_35
action_34 _ = happyFail

action_35 (15) = happyShift action_9
action_35 (18) = happyShift action_10
action_35 (21) = happyShift action_11
action_35 (24) = happyShift action_12
action_35 (27) = happyShift action_13
action_35 (29) = happyShift action_14
action_35 (30) = happyShift action_15
action_35 (32) = happyShift action_16
action_35 (33) = happyShift action_17
action_35 (34) = happyShift action_18
action_35 (35) = happyShift action_19
action_35 (8) = happyGoto action_52
action_35 (9) = happyGoto action_7
action_35 (10) = happyGoto action_8
action_35 _ = happyFail

action_36 (18) = happyShift action_42
action_36 (22) = happyShift action_43
action_36 (28) = happyShift action_44
action_36 (31) = happyShift action_45
action_36 (11) = happyGoto action_51
action_36 _ = happyFail

action_37 (15) = happyShift action_9
action_37 (18) = happyShift action_10
action_37 (21) = happyShift action_11
action_37 (24) = happyShift action_12
action_37 (27) = happyShift action_13
action_37 (29) = happyShift action_14
action_37 (30) = happyShift action_15
action_37 (32) = happyShift action_16
action_37 (33) = happyShift action_17
action_37 (34) = happyShift action_18
action_37 (35) = happyShift action_19
action_37 (8) = happyGoto action_50
action_37 (9) = happyGoto action_7
action_37 (10) = happyGoto action_8
action_37 _ = happyFail

action_38 _ = happyReduce_20

action_39 (15) = happyShift action_9
action_39 (18) = happyShift action_10
action_39 (21) = happyShift action_11
action_39 (24) = happyShift action_12
action_39 (27) = happyShift action_13
action_39 (29) = happyShift action_14
action_39 (30) = happyShift action_15
action_39 (32) = happyShift action_16
action_39 (33) = happyShift action_17
action_39 (34) = happyShift action_18
action_39 (35) = happyShift action_19
action_39 (8) = happyGoto action_49
action_39 (9) = happyGoto action_7
action_39 (10) = happyGoto action_8
action_39 _ = happyFail

action_40 (15) = happyShift action_9
action_40 (18) = happyShift action_10
action_40 (21) = happyShift action_11
action_40 (24) = happyShift action_12
action_40 (27) = happyShift action_13
action_40 (29) = happyShift action_14
action_40 (30) = happyShift action_15
action_40 (32) = happyShift action_16
action_40 (33) = happyShift action_17
action_40 (34) = happyShift action_18
action_40 (35) = happyShift action_19
action_40 (8) = happyGoto action_48
action_40 (9) = happyGoto action_7
action_40 (10) = happyGoto action_8
action_40 _ = happyFail

action_41 (20) = happyShift action_47
action_41 _ = happyReduce_9

action_42 (18) = happyShift action_42
action_42 (22) = happyShift action_43
action_42 (28) = happyShift action_44
action_42 (31) = happyShift action_45
action_42 (11) = happyGoto action_46
action_42 _ = happyFail

action_43 _ = happyReduce_22

action_44 _ = happyReduce_23

action_45 _ = happyReduce_24

action_46 (17) = happyShift action_57
action_46 (19) = happyShift action_58
action_46 (20) = happyShift action_47
action_46 _ = happyFail

action_47 (18) = happyShift action_42
action_47 (22) = happyShift action_43
action_47 (28) = happyShift action_44
action_47 (31) = happyShift action_45
action_47 (11) = happyGoto action_56
action_47 _ = happyFail

action_48 _ = happyReduce_13

action_49 (25) = happyShift action_55
action_49 (26) = happyShift action_24
action_49 _ = happyFail

action_50 (19) = happyShift action_54
action_50 (26) = happyShift action_24
action_50 _ = happyFail

action_51 (16) = happyShift action_53
action_51 (20) = happyShift action_47
action_51 _ = happyFail

action_52 (26) = happyShift action_24
action_52 _ = happyReduce_5

action_53 (15) = happyShift action_9
action_53 (18) = happyShift action_10
action_53 (21) = happyShift action_11
action_53 (24) = happyShift action_12
action_53 (27) = happyShift action_13
action_53 (29) = happyShift action_14
action_53 (30) = happyShift action_15
action_53 (32) = happyShift action_16
action_53 (33) = happyShift action_17
action_53 (34) = happyShift action_18
action_53 (35) = happyShift action_19
action_53 (8) = happyGoto action_61
action_53 (9) = happyGoto action_7
action_53 (10) = happyGoto action_8
action_53 _ = happyFail

action_54 _ = happyReduce_21

action_55 (15) = happyShift action_9
action_55 (18) = happyShift action_10
action_55 (21) = happyShift action_11
action_55 (24) = happyShift action_12
action_55 (27) = happyShift action_13
action_55 (29) = happyShift action_14
action_55 (30) = happyShift action_15
action_55 (32) = happyShift action_16
action_55 (33) = happyShift action_17
action_55 (34) = happyShift action_18
action_55 (35) = happyShift action_19
action_55 (8) = happyGoto action_60
action_55 (9) = happyGoto action_7
action_55 (10) = happyGoto action_8
action_55 _ = happyFail

action_56 (20) = happyShift action_47
action_56 _ = happyReduce_25

action_57 (18) = happyShift action_42
action_57 (22) = happyShift action_43
action_57 (28) = happyShift action_44
action_57 (31) = happyShift action_45
action_57 (11) = happyGoto action_59
action_57 _ = happyFail

action_58 _ = happyReduce_27

action_59 (19) = happyShift action_62
action_59 (20) = happyShift action_47
action_59 _ = happyFail

action_60 (26) = happyShift action_24
action_60 _ = happyReduce_8

action_61 (26) = happyShift action_24
action_61 _ = happyReduce_7

action_62 _ = happyReduce_26

happyReduce_3 = happySpecReduce_1  6 happyReduction_3
happyReduction_3 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  6 happyReduction_4
happyReduction_4 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn6
		 (Eval happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happyReduce 4 7 happyReduction_5
happyReduction_5 ((HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Def happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_6 = happySpecReduce_1  8 happyReduction_6
happyReduction_6 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happyReduce 6 8 happyReduction_7
happyReduction_7 ((HappyAbsSyn8  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Abs happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 6 8 happyReduction_8
happyReduction_8 ((HappyAbsSyn8  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Let happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_9 = happySpecReduce_3  8 happyReduction_9
happyReduction_9 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (As happy_var_3 happy_var_1
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_2  8 happyReduction_10
happyReduction_10 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (Fst happy_var_2
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_2  8 happyReduction_11
happyReduction_11 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (Snd happy_var_2
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_2  8 happyReduction_12
happyReduction_12 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (Suc happy_var_2
	)
happyReduction_12 _ _  = notHappyAtAll 

happyReduce_13 = happyReduce 4 8 happyReduction_13
happyReduction_13 ((HappyAbsSyn8  happy_var_4) `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	(HappyAbsSyn8  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Rec happy_var_2 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_2  9 happyReduction_14
happyReduction_14 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (App happy_var_1 happy_var_2
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  9 happyReduction_15
happyReduction_15 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  10 happyReduction_16
happyReduction_16 (HappyTerminal (TokVar happy_var_1))
	 =  HappyAbsSyn8
		 (LVar happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  10 happyReduction_17
happyReduction_17 _
	 =  HappyAbsSyn8
		 (Unit
	)

happyReduce_18 = happySpecReduce_1  10 happyReduction_18
happyReduction_18 (HappyTerminal (TokNum happy_var_1))
	 =  HappyAbsSyn8
		 (numToLam (read happy_var_1)
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  10 happyReduction_19
happyReduction_19 _
	 =  HappyAbsSyn8
		 (Zero
	)

happyReduce_20 = happySpecReduce_3  10 happyReduction_20
happyReduction_20 _
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (happy_var_2
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happyReduce 5 10 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Tup happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_22 = happySpecReduce_1  11 happyReduction_22
happyReduction_22 _
	 =  HappyAbsSyn11
		 (BaseT
	)

happyReduce_23 = happySpecReduce_1  11 happyReduction_23
happyReduction_23 _
	 =  HappyAbsSyn11
		 (UnitT
	)

happyReduce_24 = happySpecReduce_1  11 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn11
		 (NatT
	)

happyReduce_25 = happySpecReduce_3  11 happyReduction_25
happyReduction_25 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (FunT happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happyReduce 5 11 happyReduction_26
happyReduction_26 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (TupT happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_27 = happySpecReduce_3  11 happyReduction_27
happyReduction_27 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (happy_var_2
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_2  12 happyReduction_28
happyReduction_28 (HappyAbsSyn12  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1 : happy_var_2
	)
happyReduction_28 _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_0  12 happyReduction_29
happyReduction_29  =  HappyAbsSyn12
		 ([]
	)

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = action i i tk (HappyState action) sts stk in
	case tk of {
	TokEOF -> action 36 36 tk (HappyState action) sts stk;
	TokEquals -> cont 13;
	TokColon -> cont 14;
	TokAbs -> cont 15;
	TokDot -> cont 16;
	TokComma -> cont 17;
	TokOpen -> cont 18;
	TokClose -> cont 19;
	TokArrow -> cont 20;
	TokVar happy_dollar_dollar -> cont 21;
	TokBaseT -> cont 22;
	TokDef -> cont 23;
	TokLet -> cont 24;
	TokIn -> cont 25;
	TokAs -> cont 26;
	TokUnit -> cont 27;
	TokUnitT -> cont 28;
	TokFst -> cont 29;
	TokSnd -> cont 30;
	TokNatT -> cont 31;
	TokZero -> cont 32;
	TokSuc -> cont 33;
	TokRec -> cont 34;
	TokNum happy_dollar_dollar -> cont 35;
	_ -> happyError' tk
	})

happyError_ 36 tk = happyError' tk
happyError_ _ tk = happyError' tk

happyThen :: () => P a -> (a -> P b) -> P b
happyThen = (thenP)
happyReturn :: () => a -> P a
happyReturn = (returnP)
happyThen1 = happyThen
happyReturn1 :: () => a -> P a
happyReturn1 = happyReturn
happyError' :: () => (Token) -> P a
happyError' tk = (\token -> happyError) tk

parseStmt = happySomeParser where
  happySomeParser = happyThen (happyParse action_0) (\x -> case x of {HappyAbsSyn6 z -> happyReturn z; _other -> notHappyAtAll })

parseStmts = happySomeParser where
  happySomeParser = happyThen (happyParse action_1) (\x -> case x of {HappyAbsSyn12 z -> happyReturn z; _other -> notHappyAtAll })

term = happySomeParser where
  happySomeParser = happyThen (happyParse action_2) (\x -> case x of {HappyAbsSyn8 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


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
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}





# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4










































{-# LINE 5 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 13 "templates/GenericTemplate.hs" #-}

{-# LINE 46 "templates/GenericTemplate.hs" #-}








{-# LINE 67 "templates/GenericTemplate.hs" #-}

{-# LINE 77 "templates/GenericTemplate.hs" #-}

{-# LINE 86 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 155 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 256 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 322 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
