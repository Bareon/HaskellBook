 -- Chapter 7.4 Exercises

-- 1) Which of the following are equivalent?
-- a) mTh x y z = x * y * z
-- b) mTh x y = \z -> x * y * z
-- c) mTh x = \y -> \z -> x * y * z
-- d) mTh = \x -> \y -> \z -> x * y * z

-- All are equivalent


-- 2) mTh is type d) Num a => a -> a -> a


-- Rewrite with anonymous syntax
-- a)
addOneIfOdd n = case odd n of
  True -> f n
  False -> n
  where f = \n -> n + 1

-- b)
addFive = \x -> \y -> (if x > y then y else x) + 5

-- Rewrite without anonymous syntax
-- c)
mflip f x y = f y x
