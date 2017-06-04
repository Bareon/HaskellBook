-- Chapter 11.9 Exercises
module Jammin where

import Data.List

data Fruit =
    Peach
  | Plum
  | Apple
  | Blackberry
  deriving (Eq, Ord, Show)

--data JamJars =
--  Jam Fruit Int
--  deriving (Eq, Show)
-- 2)
data JamJars =
  Jam  { fruit :: Fruit
       , jars :: Int}
       deriving (Eq, Ord, Show)

-- 3) Cardinality is 4 * 2^64

-- 5)
row1 = Jam Peach 2
row2 = Jam Apple 5
row3 = Jam Plum 4
row4 = Jam Blackberry 12
row5 = Jam Apple 12
row6 = Jam Blackberry 3
allJam = [row1,row2,row3,row4,row5,row6]

-- 6)
countJars :: [JamJars] -> Int
countJars = sum . map jars

-- 7)
maxJam :: [JamJars] -> Int
maxJam = maximum . map jars

mostRow :: [JamJars] -> [JamJars]
mostRow jams = [x | x <- jams, jars x == maxJam jams]

-- 9)
compareKind :: JamJars -> JamJars -> Ordering
compareKind (Jam k _) (Jam k' _) = compare k k'

-- 10)
equalKind :: JamJars -> JamJars -> Bool
equalKind (Jam k _) (Jam k' _) = k == k'

groupJam :: [JamJars] -> [[JamJars]]
groupJam = (groupBy equalKind) . (sortBy compareKind) 
