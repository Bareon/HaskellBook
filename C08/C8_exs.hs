-- Chapter 8.2 Exercises
-- Write out evaluation of following
-- applyTimes 5 (+1) 5

inc :: Num a => a -> a
inc = (+1)

incTimes :: (Eq a, Num a) => a -> a -> a
incTimes 0 n = n
incTimes times n = 1 + (incTimes (times -1) n)

incTimes' :: (Eq a, Num a) => a -> a -> a
incTimes' times n = applyTimes times (+1) n

applyTimes :: (Eq a, Num a) => a -> (b -> b) -> b -> b
applyTimes 0 f b = b
applyTimes n f b = f . applyTimes (n-1) f $ b
--applyTimes n f b = f (applyTimes (n-1) f b)

-- applyTimes 5 (+1) 5
-- evaluates to 10
-- (+1) (applyTimes (5-1) (+1) 5)
-- (+1) ((+1) (applyTimes (4-1) (+1) 5))
-- (+1) ((+1) ((+1) (applyTimes (3-1) (+1) 5)))
-- (+1) ((+1) ((+1) ((+1) (applyTimes (2-1) (+1) 5))))
-- (+1) ((+1) ((+1) ((+1) ((+1) (applyTimes (0) (+1) 5)))))
-- (+1) ((+1) ((+1) ((+1) ((+1) (5)))))
-- \u03BB> (+1) ((+1) ((+1) ((+1) ((+1) (5)))))
-- 10   
f :: Bool -> Maybe Int
f False = Just 0
f _ = Nothing


-- Chapter 8.6 Exercises
-- Review of types
-- 1) What is the type of [[True, False], [True, True], [False, True]]
-- d) [[Bool]]

-- 2) Which has the same type as 1)
-- b) [[3 == 3], [6 > 5], [3 < 4]]

-- 3) For the following function, which is true?
func :: [a] -> [a] -> [a]
func x y = x ++ y
-- d) all of the above; x and y must be of the same type, lists, and
-- if x is a String then y must be a String

-- 4) For the func code above, which is a valid application to both
-- of its arguments?
-- b) func "Hello" "World"


-- Review of currying
cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

-- fill in the types
flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"

-- 1) value of appedCatty "woohoo!" is "woops mrow woohoo!"
-- 2) frappe "1" = "1 mrow haha"
-- 3) frappe (appedCatty "2") = "woops mrow 2 mrow haha"
-- 4) appedCatty (frappe "blue") = "woops mrow blue mrow haha"
-- 5) "pink mrow haha mrow green mrow woops mrow blue"
-- 6) "are mrow Pugs mrow awesome"


-- Recursion
-- 1) Write out steps for reducing dividedBy 15 2 to final answer
-- according to Haskell code
--dividedBy :: Integral a => a -> a -> (a,a)
--dividedBy num denom = go num denom 0
--  where go n   d count
--         | n < d = (count, n)
--        | otherwise = go (n - d) d (count + 1)
-- otherwise = go (15 - 2) 2 (0 + 1)
-- go 13 2 1
-- otherwise = go (13 - 2) 2 (1 + 1)
-- go 11 2 2
-- otherwise = go (11 - 2) 2 (2 + 1)
-- go 9 2 3
-- otherwise = go (9 - 2) 2 (3 + 1)
-- go 7 2 4
-- otherwise = go (7 - 2) 2 (4 + 1)
-- go 5 2 5
-- otherwise = go (5 - 2) 2 (5 + 1)
-- go 3 2 6
-- otherwise = go (3 - 2) 2 (6 + 1)
-- go 1 2 7
-- 1 < 2 = (7, 1)

-- 2)
sumN :: (Eq a, Num a) => a -> a
sumN n
  | n /= 0 = n + sumN (n - 1)
  | otherwise = 0
  

-- 3)
multTwo :: (Integral a) => a -> a -> a
multTwo x y
  | y /= 0 = x + multTwo x (y - 1)
  | otherwise = 0


-- Fixing dividedBy
data DividedResult =
  Result (Integer, Integer)
  | DividedByZero
  deriving Show

dividedBy :: Integer -> Integer -> DividedResult
dividedBy num denom
  | denom == 0 = DividedByZero
  | otherwise = go num' denom' 0 where
    num' = abs(num)
    denom' = abs(denom)
    go n   d count
      | n < d = Result(if num * denom < 0 then
        (negate count, negate n) else
        (count, n))
      | otherwise = go (n - d) d (count + 1)


-- McCarthy 91 function
mc91 :: Integral a => a -> a
mc91 x
  | x > 100 = x - 10
  | otherwise = mc91 . mc91 $ (x+11)
