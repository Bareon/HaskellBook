-- Rewrite old functions using fold
-- direct recursion, not using (&&)
myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x:xs) =
  if x == False
  then False
  else myAnd xs

-- direct recursion, using (&&)
myAnd' :: [Bool] -> Bool
myAnd' [] = True
myAnd' (x:xs) = x && myAnd' xs

-- fold, not point-free in folding function
myAnd'' :: [Bool] -> Bool
myAnd'' = foldr
          (\a b ->
            if a == False
            then False
            else b) True

-- fold, point-free
myAndPF :: [Bool] -> Bool
myAndPF = foldr (&&) True

-- 1)
myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) = x || myOr xs

myOr' :: [Bool] -> Bool
myOr' = foldr (||) False

-- 2)
myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
--myAny f xs = myOr $ map f xs
myAny f (x:xs) = f x || myAny f xs

myAny' :: (a -> Bool) -> [a] -> Bool
myAny' f = foldr ((||) . f) False

-- 3)
myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem e (x:xs) = e == x || myElem e xs 

myElem' :: Eq a => a -> [a] -> Bool
myElem' e xs  = any (e==) xs

myElem'' :: Eq a => a -> [a] -> Bool
myElem'' = any . (==)

myElem''' :: Eq a => a -> [a] -> Bool
myElem''' e = foldr ((||) . (== e)) False  

-- 4)
myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

myReverse' :: [a] -> [a]
myReverse' = foldl (flip(:)) []

-- 5)
myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr ((:) .f) []

-- 6)
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f = foldr (\x -> if f x then (x:) else id) [] 

-- 7)
squish :: [[a]] -> [a]
squish xs = concat xs

squish' :: [[a]] -> [a]
squish' = foldr (flip $ foldr (:)) []


-- 8)
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ [] = []
squishMap f (x:xs) = f x ++ squishMap f xs

squishMap' :: (a -> [b]) -> [a] -> [b]
squishMap' f = foldr ((++) . f) []


-- 9)
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

-- 10)
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ (x:[]) = x
myMaximumBy comp (x:y:xs)
 | comp x y == GT = x
 | otherwise = myMaximumBy comp (y:xs)

myMaximumBy' :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy' f xs = foldr (\x y -> if f x y == GT then x else y) (last xs) xs

-- 9)
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ (x:[]) = x
myMinimumBy comp (x:y:xs)
 | comp x y == LT = x
 | otherwise = myMinimumBy comp (y:xs)

myMinimumBy' :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy' f xs = foldr (\x y -> if f x y == LT then x else y) (last xs) xs

