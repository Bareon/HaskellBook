-- Chapter 9.12 Exercises, standard functions

myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x:xs) = x && myAnd xs

-- 1) myOr returns True if any Bool in the list is True.
myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) = x || myOr xs

-- 2) myAny returns True if a -> Bool applied to any of the values in the list returns True
myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
--myAny f xs = myOr $ map f xs
myAny f (x:xs) = f x || myAny f xs

-- 3)
myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem e (x:xs) = e == x || myElem e xs 

myElem' :: Eq a => a -> [a] -> Bool
myElem' e xs  = any (e==) xs

-- 4)
myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

-- 5)
squish :: [[a]] -> [a]
squish xs = concat xs

-- 6)
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ [] = []
squishMap f (x:xs) = f x ++ squishMap f xs

-- 7)
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

-- 8)
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ (x:[]) = x
myMaximumBy comp (x:y:xs)
 | comp x y == GT = x
 | otherwise = myMaximumBy comp (y:xs)

-- 9)
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ (x:[]) = x
myMinimumBy comp (x:y:xs)
 | comp x y == LT = x
 | otherwise = myMinimumBy comp (y:xs)

myMaximum :: (Ord a) => [a] -> a
myMaximum = myMaximumBy compare

myMinimum :: (Ord a) => [a] -> a
myMinimum = myMinimumBy compare
