-- Chapter 11.8 Exercises
import Data.Int

-- 1)
data BigSmall =
  Big Bool | Small Bool deriving (Eq, Show)
-- Cardinality of 2. length of [Big Bool, Small Bool] = 2

-- 2)
data NumberOrBool =
  Numba Int8 | BoolyBool Bool deriving (Eq, Show)
-- Cardinality is 258. Int8 = 256, Bool = 2
