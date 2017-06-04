-- Chapter 11.7 Exercises
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}

class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42

newtype Goats = Goats Int deriving (Eq, Show, TooMany)

--instance TooMany Goats where
--  tooMany (Goats n) = tooMany n

-- 1)
instance TooMany (Int, String) where
  tooMany (n, _) = n > 42

-- 2)
instance TooMany (Int, Int) where
  tooMany (n1, n2) = (n1 + n2) > 42

-- 3)
instance (Num a, TooMany a) => TooMany (a, a) where
  tooMany (n1, n2) = tooMany (n1 + n2)
