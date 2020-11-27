{-# OPTIONS_GHC -w #-}
module Main where
import Lexical
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.12

data HappyAbsSyn t4
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,220) ([16528,57,4096,64,32768,135,1024,0,16386,58626,33056,114,0,0,49152,0,10258,2311,916,12768,61440,18,24576,0,18480,7328,20516,4622,1832,37897,1155,458,0,0,0,0,6144,0,12,0,1,136,16384,0,34,0,0,0,0,0,0,32,0,3,384,1024,0,96,12288,16384,0,32,4096,0,32776,51716,1,2,256,32768,0,64,20516,32782,199,4096,0,8,1024,0,2,1596,32768,0,64,8192,0,32784,51716,577,8421,29313,16528,8249,0,20516,4622,1832,37897,1155,458,0,30720,12,1596,7680,3,399,8192,49152,99,12768,61440,24,3192,64,8192,0,16,2048,0,37897,3,0,0,0,0,0,7680,3,64,8192,0,16,2048,576,8421,29313,16528,18489,7328,0,32768,199,25536,57344,49,6384,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_calc","Exp","if","then","else","while","'='","'+='","'+'","'-'","'*'","'/'","'('","')'","'{'","'}'","';'","conds","int","var","%eof"]
        bit_start = st * 23
        bit_end = (st + 1) * 23
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..22]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (5) = happyShift action_4
action_0 (8) = happyShift action_5
action_0 (15) = happyShift action_6
action_0 (17) = happyShift action_7
action_0 (20) = happyShift action_8
action_0 (21) = happyShift action_9
action_0 (22) = happyShift action_10
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (22) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (9) = happyShift action_11
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (11) = happyShift action_17
action_3 (12) = happyShift action_18
action_3 (13) = happyShift action_19
action_3 (14) = happyShift action_20
action_3 (19) = happyShift action_21
action_3 (23) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (15) = happyShift action_16
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (15) = happyShift action_15
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (5) = happyShift action_4
action_6 (8) = happyShift action_5
action_6 (15) = happyShift action_6
action_6 (17) = happyShift action_7
action_6 (20) = happyShift action_8
action_6 (21) = happyShift action_9
action_6 (22) = happyShift action_10
action_6 (4) = happyGoto action_14
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (5) = happyShift action_4
action_7 (8) = happyShift action_5
action_7 (15) = happyShift action_6
action_7 (17) = happyShift action_7
action_7 (20) = happyShift action_8
action_7 (21) = happyShift action_9
action_7 (22) = happyShift action_10
action_7 (4) = happyGoto action_13
action_7 _ = happyFail (happyExpListPerState 7)

action_8 _ = happyReduce_26

action_9 _ = happyReduce_27

action_10 (9) = happyShift action_11
action_10 (10) = happyShift action_12
action_10 _ = happyReduce_28

action_11 (5) = happyShift action_4
action_11 (8) = happyShift action_5
action_11 (15) = happyShift action_6
action_11 (17) = happyShift action_7
action_11 (20) = happyShift action_8
action_11 (21) = happyShift action_9
action_11 (22) = happyShift action_10
action_11 (4) = happyGoto action_34
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (5) = happyShift action_4
action_12 (8) = happyShift action_5
action_12 (15) = happyShift action_6
action_12 (17) = happyShift action_7
action_12 (20) = happyShift action_8
action_12 (21) = happyShift action_9
action_12 (22) = happyShift action_10
action_12 (4) = happyGoto action_33
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (11) = happyShift action_17
action_13 (12) = happyShift action_18
action_13 (13) = happyShift action_19
action_13 (14) = happyShift action_20
action_13 (18) = happyShift action_32
action_13 (19) = happyShift action_21
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (11) = happyShift action_17
action_14 (12) = happyShift action_18
action_14 (13) = happyShift action_19
action_14 (14) = happyShift action_20
action_14 (16) = happyShift action_31
action_14 (19) = happyShift action_21
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (21) = happyShift action_29
action_15 (22) = happyShift action_30
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (21) = happyShift action_27
action_16 (22) = happyShift action_28
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (5) = happyShift action_4
action_17 (8) = happyShift action_5
action_17 (15) = happyShift action_6
action_17 (17) = happyShift action_7
action_17 (20) = happyShift action_8
action_17 (21) = happyShift action_9
action_17 (22) = happyShift action_10
action_17 (4) = happyGoto action_26
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (5) = happyShift action_4
action_18 (8) = happyShift action_5
action_18 (15) = happyShift action_6
action_18 (17) = happyShift action_7
action_18 (20) = happyShift action_8
action_18 (21) = happyShift action_9
action_18 (22) = happyShift action_10
action_18 (4) = happyGoto action_25
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (5) = happyShift action_4
action_19 (8) = happyShift action_5
action_19 (15) = happyShift action_6
action_19 (17) = happyShift action_7
action_19 (20) = happyShift action_8
action_19 (21) = happyShift action_9
action_19 (22) = happyShift action_10
action_19 (4) = happyGoto action_24
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (5) = happyShift action_4
action_20 (8) = happyShift action_5
action_20 (15) = happyShift action_6
action_20 (17) = happyShift action_7
action_20 (20) = happyShift action_8
action_20 (21) = happyShift action_9
action_20 (22) = happyShift action_10
action_20 (4) = happyGoto action_23
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (5) = happyShift action_4
action_21 (8) = happyShift action_5
action_21 (15) = happyShift action_6
action_21 (17) = happyShift action_7
action_21 (20) = happyShift action_8
action_21 (21) = happyShift action_9
action_21 (22) = happyShift action_10
action_21 (4) = happyGoto action_22
action_21 _ = happyReduce_24

action_22 (11) = happyShift action_17
action_22 (12) = happyShift action_18
action_22 (13) = happyShift action_19
action_22 (14) = happyShift action_20
action_22 (19) = happyShift action_21
action_22 _ = happyReduce_25

action_23 (19) = happyShift action_21
action_23 _ = happyReduce_6

action_24 (19) = happyShift action_21
action_24 _ = happyReduce_5

action_25 (13) = happyShift action_19
action_25 (14) = happyShift action_20
action_25 (19) = happyShift action_21
action_25 _ = happyReduce_4

action_26 (13) = happyShift action_19
action_26 (14) = happyShift action_20
action_26 (19) = happyShift action_21
action_26 _ = happyReduce_3

action_27 (20) = happyShift action_40
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (16) = happyShift action_38
action_28 (20) = happyShift action_39
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (20) = happyShift action_37
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (16) = happyShift action_35
action_30 (20) = happyShift action_36
action_30 _ = happyFail (happyExpListPerState 30)

action_31 _ = happyReduce_22

action_32 _ = happyReduce_23

action_33 (11) = happyShift action_17
action_33 (12) = happyShift action_18
action_33 (13) = happyShift action_19
action_33 (14) = happyShift action_20
action_33 (19) = happyShift action_21
action_33 _ = happyReduce_2

action_34 (11) = happyShift action_17
action_34 (12) = happyShift action_18
action_34 (13) = happyShift action_19
action_34 (14) = happyShift action_20
action_34 (19) = happyShift action_21
action_34 _ = happyReduce_1

action_35 (17) = happyShift action_50
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (21) = happyShift action_48
action_36 (22) = happyShift action_49
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (21) = happyShift action_46
action_37 (22) = happyShift action_47
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (17) = happyShift action_45
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (21) = happyShift action_43
action_39 (22) = happyShift action_44
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (21) = happyShift action_41
action_40 (22) = happyShift action_42
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (16) = happyShift action_60
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (16) = happyShift action_59
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (16) = happyShift action_58
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (16) = happyShift action_57
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (5) = happyShift action_4
action_45 (8) = happyShift action_5
action_45 (15) = happyShift action_6
action_45 (17) = happyShift action_7
action_45 (20) = happyShift action_8
action_45 (21) = happyShift action_9
action_45 (22) = happyShift action_10
action_45 (4) = happyGoto action_56
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (16) = happyShift action_55
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (16) = happyShift action_54
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (16) = happyShift action_53
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (16) = happyShift action_52
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (5) = happyShift action_4
action_50 (8) = happyShift action_5
action_50 (15) = happyShift action_6
action_50 (17) = happyShift action_7
action_50 (20) = happyShift action_8
action_50 (21) = happyShift action_9
action_50 (22) = happyShift action_10
action_50 (4) = happyGoto action_51
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (11) = happyShift action_17
action_51 (12) = happyShift action_18
action_51 (13) = happyShift action_19
action_51 (14) = happyShift action_20
action_51 (18) = happyShift action_70
action_51 (19) = happyShift action_21
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (17) = happyShift action_69
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (17) = happyShift action_68
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (17) = happyShift action_67
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (17) = happyShift action_66
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (11) = happyShift action_17
action_56 (12) = happyShift action_18
action_56 (13) = happyShift action_19
action_56 (14) = happyShift action_20
action_56 (18) = happyShift action_65
action_56 (19) = happyShift action_21
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (17) = happyShift action_64
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (17) = happyShift action_63
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (17) = happyShift action_62
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (17) = happyShift action_61
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (5) = happyShift action_4
action_61 (8) = happyShift action_5
action_61 (15) = happyShift action_6
action_61 (17) = happyShift action_7
action_61 (20) = happyShift action_8
action_61 (21) = happyShift action_9
action_61 (22) = happyShift action_10
action_61 (4) = happyGoto action_79
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (5) = happyShift action_4
action_62 (8) = happyShift action_5
action_62 (15) = happyShift action_6
action_62 (17) = happyShift action_7
action_62 (20) = happyShift action_8
action_62 (21) = happyShift action_9
action_62 (22) = happyShift action_10
action_62 (4) = happyGoto action_78
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (5) = happyShift action_4
action_63 (8) = happyShift action_5
action_63 (15) = happyShift action_6
action_63 (17) = happyShift action_7
action_63 (20) = happyShift action_8
action_63 (21) = happyShift action_9
action_63 (22) = happyShift action_10
action_63 (4) = happyGoto action_77
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (5) = happyShift action_4
action_64 (8) = happyShift action_5
action_64 (15) = happyShift action_6
action_64 (17) = happyShift action_7
action_64 (20) = happyShift action_8
action_64 (21) = happyShift action_9
action_64 (22) = happyShift action_10
action_64 (4) = happyGoto action_76
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (7) = happyShift action_75
action_65 _ = happyReduce_7

action_66 (5) = happyShift action_4
action_66 (8) = happyShift action_5
action_66 (15) = happyShift action_6
action_66 (17) = happyShift action_7
action_66 (20) = happyShift action_8
action_66 (21) = happyShift action_9
action_66 (22) = happyShift action_10
action_66 (4) = happyGoto action_74
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (5) = happyShift action_4
action_67 (8) = happyShift action_5
action_67 (15) = happyShift action_6
action_67 (17) = happyShift action_7
action_67 (20) = happyShift action_8
action_67 (21) = happyShift action_9
action_67 (22) = happyShift action_10
action_67 (4) = happyGoto action_73
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (5) = happyShift action_4
action_68 (8) = happyShift action_5
action_68 (15) = happyShift action_6
action_68 (17) = happyShift action_7
action_68 (20) = happyShift action_8
action_68 (21) = happyShift action_9
action_68 (22) = happyShift action_10
action_68 (4) = happyGoto action_72
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (5) = happyShift action_4
action_69 (8) = happyShift action_5
action_69 (15) = happyShift action_6
action_69 (17) = happyShift action_7
action_69 (20) = happyShift action_8
action_69 (21) = happyShift action_9
action_69 (22) = happyShift action_10
action_69 (4) = happyGoto action_71
action_69 _ = happyFail (happyExpListPerState 69)

action_70 _ = happyReduce_17

action_71 (11) = happyShift action_17
action_71 (12) = happyShift action_18
action_71 (13) = happyShift action_19
action_71 (14) = happyShift action_20
action_71 (18) = happyShift action_88
action_71 (19) = happyShift action_21
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (11) = happyShift action_17
action_72 (12) = happyShift action_18
action_72 (13) = happyShift action_19
action_72 (14) = happyShift action_20
action_72 (18) = happyShift action_87
action_72 (19) = happyShift action_21
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (11) = happyShift action_17
action_73 (12) = happyShift action_18
action_73 (13) = happyShift action_19
action_73 (14) = happyShift action_20
action_73 (18) = happyShift action_86
action_73 (19) = happyShift action_21
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (11) = happyShift action_17
action_74 (12) = happyShift action_18
action_74 (13) = happyShift action_19
action_74 (14) = happyShift action_20
action_74 (18) = happyShift action_85
action_74 (19) = happyShift action_21
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (17) = happyShift action_84
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (11) = happyShift action_17
action_76 (12) = happyShift action_18
action_76 (13) = happyShift action_19
action_76 (14) = happyShift action_20
action_76 (18) = happyShift action_83
action_76 (19) = happyShift action_21
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (11) = happyShift action_17
action_77 (12) = happyShift action_18
action_77 (13) = happyShift action_19
action_77 (14) = happyShift action_20
action_77 (18) = happyShift action_82
action_77 (19) = happyShift action_21
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (11) = happyShift action_17
action_78 (12) = happyShift action_18
action_78 (13) = happyShift action_19
action_78 (14) = happyShift action_20
action_78 (18) = happyShift action_81
action_78 (19) = happyShift action_21
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (11) = happyShift action_17
action_79 (12) = happyShift action_18
action_79 (13) = happyShift action_19
action_79 (14) = happyShift action_20
action_79 (18) = happyShift action_80
action_79 (19) = happyShift action_21
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (7) = happyShift action_93
action_80 _ = happyReduce_11

action_81 (7) = happyShift action_92
action_81 _ = happyReduce_10

action_82 (7) = happyShift action_91
action_82 _ = happyReduce_9

action_83 (7) = happyShift action_90
action_83 _ = happyReduce_8

action_84 (5) = happyShift action_4
action_84 (8) = happyShift action_5
action_84 (15) = happyShift action_6
action_84 (17) = happyShift action_7
action_84 (20) = happyShift action_8
action_84 (21) = happyShift action_9
action_84 (22) = happyShift action_10
action_84 (4) = happyGoto action_89
action_84 _ = happyFail (happyExpListPerState 84)

action_85 _ = happyReduce_21

action_86 _ = happyReduce_20

action_87 _ = happyReduce_19

action_88 _ = happyReduce_18

action_89 (11) = happyShift action_17
action_89 (12) = happyShift action_18
action_89 (13) = happyShift action_19
action_89 (14) = happyShift action_20
action_89 (18) = happyShift action_98
action_89 (19) = happyShift action_21
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (17) = happyShift action_97
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (17) = happyShift action_96
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (17) = happyShift action_95
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (17) = happyShift action_94
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (5) = happyShift action_4
action_94 (8) = happyShift action_5
action_94 (15) = happyShift action_6
action_94 (17) = happyShift action_7
action_94 (20) = happyShift action_8
action_94 (21) = happyShift action_9
action_94 (22) = happyShift action_10
action_94 (4) = happyGoto action_102
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (5) = happyShift action_4
action_95 (8) = happyShift action_5
action_95 (15) = happyShift action_6
action_95 (17) = happyShift action_7
action_95 (20) = happyShift action_8
action_95 (21) = happyShift action_9
action_95 (22) = happyShift action_10
action_95 (4) = happyGoto action_101
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (5) = happyShift action_4
action_96 (8) = happyShift action_5
action_96 (15) = happyShift action_6
action_96 (17) = happyShift action_7
action_96 (20) = happyShift action_8
action_96 (21) = happyShift action_9
action_96 (22) = happyShift action_10
action_96 (4) = happyGoto action_100
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (5) = happyShift action_4
action_97 (8) = happyShift action_5
action_97 (15) = happyShift action_6
action_97 (17) = happyShift action_7
action_97 (20) = happyShift action_8
action_97 (21) = happyShift action_9
action_97 (22) = happyShift action_10
action_97 (4) = happyGoto action_99
action_97 _ = happyFail (happyExpListPerState 97)

action_98 _ = happyReduce_12

action_99 (11) = happyShift action_17
action_99 (12) = happyShift action_18
action_99 (13) = happyShift action_19
action_99 (14) = happyShift action_20
action_99 (18) = happyShift action_106
action_99 (19) = happyShift action_21
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (11) = happyShift action_17
action_100 (12) = happyShift action_18
action_100 (13) = happyShift action_19
action_100 (14) = happyShift action_20
action_100 (18) = happyShift action_105
action_100 (19) = happyShift action_21
action_100 _ = happyFail (happyExpListPerState 100)

action_101 (11) = happyShift action_17
action_101 (12) = happyShift action_18
action_101 (13) = happyShift action_19
action_101 (14) = happyShift action_20
action_101 (18) = happyShift action_104
action_101 (19) = happyShift action_21
action_101 _ = happyFail (happyExpListPerState 101)

action_102 (11) = happyShift action_17
action_102 (12) = happyShift action_18
action_102 (13) = happyShift action_19
action_102 (14) = happyShift action_20
action_102 (18) = happyShift action_103
action_102 (19) = happyShift action_21
action_102 _ = happyFail (happyExpListPerState 102)

action_103 _ = happyReduce_16

action_104 _ = happyReduce_15

action_105 _ = happyReduce_14

action_106 _ = happyReduce_13

happyReduce_1 = happySpecReduce_3  4 happyReduction_1
happyReduction_1 (HappyAbsSyn4  happy_var_3)
	_
	(HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn4
		 (\p -> Assign (Leaf happy_var_1) (happy_var_3 p)
	)
happyReduction_1 _ _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_3  4 happyReduction_2
happyReduction_2 (HappyAbsSyn4  happy_var_3)
	_
	(HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn4
		 (\p -> AssignInc (Leaf happy_var_1) (happy_var_3 p)
	)
happyReduction_2 _ _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_3  4 happyReduction_3
happyReduction_3 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (\p -> Sum (happy_var_1 p) (happy_var_3 p)
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_3  4 happyReduction_4
happyReduction_4 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (\p -> Sub (happy_var_1 p) (happy_var_3 p)
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  4 happyReduction_5
happyReduction_5 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (\p -> Prod (happy_var_1 p) (happy_var_3 p)
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  4 happyReduction_6
happyReduction_6 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (\p -> Div (happy_var_1 p) (happy_var_3 p)
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happyReduce 7 4 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (\p -> If (Leaf happy_var_3) (happy_var_6 p)
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 9 4 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_5)) `HappyStk`
	(HappyTerminal (TokenConds happy_var_4)) `HappyStk`
	(HappyTerminal (TokenId happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (\p -> Cond (Leaf happy_var_3) (Leaf happy_var_4) (Leaf happy_var_5) (happy_var_8 p)
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 9 4 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_5)) `HappyStk`
	(HappyTerminal (TokenConds happy_var_4)) `HappyStk`
	(HappyTerminal (TokenId happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (\p -> Cond (Leaf happy_var_3) (Leaf happy_var_4) (Leaf happy_var_5) (happy_var_8 p)
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 9 4 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_5)) `HappyStk`
	(HappyTerminal (TokenConds happy_var_4)) `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (\p -> Cond (Leaf happy_var_3) (Leaf happy_var_4) (Leaf happy_var_5) (happy_var_8 p)
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 9 4 happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_5)) `HappyStk`
	(HappyTerminal (TokenConds happy_var_4)) `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (\p -> Cond (Leaf happy_var_3) (Leaf happy_var_4) (Leaf happy_var_5) (happy_var_8 p)
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 11 4 happyReduction_12
happyReduction_12 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_10) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (\p -> IfElse (Leaf happy_var_3) (happy_var_6 p) (happy_var_10 p)
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 13 4 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_12) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_5)) `HappyStk`
	(HappyTerminal (TokenConds happy_var_4)) `HappyStk`
	(HappyTerminal (TokenId happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (\p -> CondElse (Leaf happy_var_3) (Leaf happy_var_4) (Leaf happy_var_5) (happy_var_8 p) (happy_var_12 p)
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 13 4 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_12) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_5)) `HappyStk`
	(HappyTerminal (TokenConds happy_var_4)) `HappyStk`
	(HappyTerminal (TokenId happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (\p -> CondElse (Leaf happy_var_3) (Leaf happy_var_4) (Leaf happy_var_5) (happy_var_8 p) (happy_var_12 p)
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 13 4 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_12) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_5)) `HappyStk`
	(HappyTerminal (TokenConds happy_var_4)) `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (\p -> CondElse (Leaf happy_var_3) (Leaf happy_var_4) (Leaf happy_var_5) (happy_var_8 p) (happy_var_12 p)
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 13 4 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_12) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_5)) `HappyStk`
	(HappyTerminal (TokenConds happy_var_4)) `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (\p -> CondElse (Leaf happy_var_3) (Leaf happy_var_4) (Leaf happy_var_5) (happy_var_8 p) (happy_var_12 p)
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 7 4 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (\p -> While (Leaf happy_var_3) (happy_var_6 p)
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 9 4 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_5)) `HappyStk`
	(HappyTerminal (TokenConds happy_var_4)) `HappyStk`
	(HappyTerminal (TokenId happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (\p -> WhileCond (Leaf happy_var_3) (Leaf happy_var_4) (Leaf happy_var_5) (happy_var_8 p)
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 9 4 happyReduction_19
happyReduction_19 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_5)) `HappyStk`
	(HappyTerminal (TokenConds happy_var_4)) `HappyStk`
	(HappyTerminal (TokenId happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (\p -> WhileCond (Leaf happy_var_3) (Leaf happy_var_4) (Leaf happy_var_5) (happy_var_8 p)
	) `HappyStk` happyRest

happyReduce_20 = happyReduce 9 4 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_5)) `HappyStk`
	(HappyTerminal (TokenConds happy_var_4)) `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (\p -> WhileCond (Leaf happy_var_3) (Leaf happy_var_4) (Leaf happy_var_5) (happy_var_8 p)
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 9 4 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_5)) `HappyStk`
	(HappyTerminal (TokenConds happy_var_4)) `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (\p -> WhileCond (Leaf happy_var_3) (Leaf happy_var_4) (Leaf happy_var_5) (happy_var_8 p)
	) `HappyStk` happyRest

happyReduce_22 = happySpecReduce_3  4 happyReduction_22
happyReduction_22 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (happy_var_2
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  4 happyReduction_23
happyReduction_23 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (happy_var_2
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_2  4 happyReduction_24
happyReduction_24 _
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1
	)
happyReduction_24 _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  4 happyReduction_25
happyReduction_25 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (\p -> Concat (happy_var_1 p) (happy_var_3 p)
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  4 happyReduction_26
happyReduction_26 (HappyTerminal (TokenConds happy_var_1))
	 =  HappyAbsSyn4
		 (\p -> Leaf happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  4 happyReduction_27
happyReduction_27 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn4
		 (\p -> Leaf happy_var_1
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  4 happyReduction_28
happyReduction_28 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn4
		 (\p -> Leaf happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 23 23 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenIf -> cont 5;
	TokenThen -> cont 6;
	TokenElse -> cont 7;
	TokenWhile -> cont 8;
	TokenAssign -> cont 9;
	TokenAssignInc -> cont 10;
	TokenPlus -> cont 11;
	TokenMinus -> cont 12;
	TokenTimes -> cont 13;
	TokenDiv -> cont 14;
	TokenOpenBracket -> cont 15;
	TokenCloseBracket -> cont 16;
	TokenOpenBrace -> cont 17;
	TokenCloseBrace -> cont 18;
	TokenConcat -> cont 19;
	TokenConds happy_dollar_dollar -> cont 20;
	TokenInt happy_dollar_dollar -> cont 21;
	TokenId happy_dollar_dollar -> cont 22;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 23 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
calc tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError _ = error "Parse error"

data Tree a = Leaf a
		| Cond (Tree a) (Tree a) (Tree a) (Tree a)
		| CondElse (Tree a) (Tree a) (Tree a) (Tree a) (Tree a)
		| Concat (Tree a) (Tree a)
		| If (Tree a) (Tree a)
		| IfElse (Tree a) (Tree a) (Tree a)
		| While (Tree a) (Tree a)
		| WhileCond (Tree a) (Tree a) (Tree a) (Tree a)
		| Assign (Tree a) (Tree a)
		| AssignInc (Tree a) (Tree a)
		| Sum (Tree a) (Tree a)
		| Sub (Tree a) (Tree a)
		| Prod (Tree a) (Tree a)
		| Div (Tree a) (Tree a)
	deriving (Show)

main = do s <- getContents
	  print (calc (lexer s) [])
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






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
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

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
