--Chapter 4.7 exercises

awesome = ["Papuchon", "curry", "Haskell"]
alsoAwesome = ["Quake", "The Simons"]
allAwesome = [awesome, alsoAwesome]

--1. Length is type signature List, returns Int
--2. a) 5
--   b) 3
--   c) 2
--   d) 5

--3. 6 / length [1,2,3] returns an error because length/Int is not
--part of the Fractional typeclass

--4. 6 `div` length [1,2,3] fixes the error

--5. 2 + 3 == 5 is Bool type, returns True

--6. False

--7. length allAwesome == 2 -> True
-- length [1, 'a', 3, 'b'] -> 4
-- length allAwesome + length awesome -> 5
-- ( 8 == 8 ) && ('b' < 'a') -> false
-- ( 8 == 8 ) && 9 -> error, 9 is not bool

--8.
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = x == reverse x

--9.
myAbs :: Integer -> Integer
myAbs x = if (x < 0) then abs x else x 

--10.
f :: (a,b) -> (c,d) -> ((b,d), (a,c))
f x y = ((snd x,snd y), (fst x, fst y))
