-- Chapter 7.12 Exercises

-- 1) A polymorphic function
-- d) may resolve to values of different types, depending on inputs

-- 2) Two functions f and g have types Char -> String and
-- String -> [String] respectively. Composed function g . f has type
-- d) Char -> String -> [String]
f2 :: Char -> String
f2 = undefined
g2 :: String -> [String]
g2 = undefined
-- :t (g2 . f2)
-- (g2 . f2) :: Char -> [String] 


-- 3) A function f has type Ord a => a -> a -> Bool and we apply it
-- to one numeric value. what is the type now?
-- d) (Ord a, Num a) => a -> Bool
f3 :: Ord a => a -> a -> Bool
f3 = undefined
-- :t f3 1
-- f3 1 :: (Num a, Ord a) => a -> Bool 


-- 4) A function with the type (a -> b) -> c
-- b) is a higher order function


-- 5) Given the following definition of f, what is the type of f True?
f5 :: a -> a
f5 x = x
-- a) f True :: Bool
-- \u03BB> :t f5 True
-- f5 True :: Bool 


-- Let's write code
-- 1) Returns tens digit of integral argument
--tensDigit :: Integral a => a -> a
--tensDigit x = d
--  where xLast = x `div` 10
--        d     = xLast `mod` 10

-- a) Rewrite usinv divMod
tensDigit :: Integral a => a -> a
tensDigit x = fst $ divMod x 10  
-- b) Has same type as original
-- c) Hundreds digit
hunsD :: Integral a => a -> a
hunsD x = fst $ divMod x 100


-- 2) Implement function of type a -> a -> Bool -> a, one with case
-- one with guard
foldBool :: a -> a -> Bool -> a
foldBool x y b =
  case b of
    True  -> x
    False -> y

foldBool' :: a -> a -> Bool -> a
foldBool' x y b
 | b == True  = x
 | b == False = y


-- 3) Fill in definition
g :: (a -> b) -> (a,  c) -> (b, c)
g f (x,y) = (f x,y)


