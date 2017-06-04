-- Chapter 9.7 exercises
import Data.Bool

mySqr = [x^2 | x <- [1..5]]
myCube = [y^3 | y <- [1..5]]

-- 1), 2)
myTup = [(x,y) | x <- mySqr, y <- myCube, x < 50, y < 50]


-- 3)
count = length myTup


-- Chapter 9.8 exercise, map bool
mapBool :: (Eq a, Num a) => a -> a
mapBool x 
  | x == 3    = bool x (-x) True
  | otherwise = bool x (-x) False
