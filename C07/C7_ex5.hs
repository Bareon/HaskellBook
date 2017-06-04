-- Chapter 7.8 Exercises

avgGrade :: (Fractional a, Ord a) => a -> Char
avgGrade x
  | y >= 0.9   = 'A'
  | y >= 0.8   = 'B'
  | y >= 0.7   = 'C'
  | y >= 0.59  = 'D'
  | y <  0.59  = 'F'
  where y = x / 100
  
-- 1) Top guard otherwise case will always return, since otherwise
-- is always true. Lower guards will never be reached.

-- 2) It will typecheck but not work the same, 90 will pass True for both C and A conditions. If C is first it will pass before reaching A.

-- 3) returns b) True when xs is a palindrome
pal xs
  | xs == reverse xs = True
  | otherwise        = False

-- 4) pal can take any argument with an instance of Eq. Eq a => [a]


-- 5) Eq a => [a] -> Bool


-- 6) returns c) inication of wheter argument is positive, negative, zero
numbers x
  | x < 0  = 1
  | x == 0 = 0
  | x > 0  = 1

-- 7) numbers can take any (Ord a, Num a) => a argument

-- 8) numbers is (Ord a, Num a, Num b) => a -> b type
