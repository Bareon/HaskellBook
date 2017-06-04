-- Chapter 12 Exercises - It's only Natural

data Nat =
    Zero
  | Succ Nat
  deriving (Eq, Show)

natToInteger :: Nat -> Integer
natToInteger Zero = 0
natToInteger (Succ n) = 1 + natToInteger n

integerToNat :: Integer -> Maybe Nat
integerToNat i 
  | i > 0 = Just $ intToNat i
  | otherwise = Nothing

intToNat :: Integer -> Nat
intToNat 0 = Zero
intToNat i = Succ $ intToNat $ i-1
