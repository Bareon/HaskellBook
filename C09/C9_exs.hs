-- Chapter Exercises
import Data.Char

safeHead         :: [a] -> Maybe a
safeHead []      = Nothing
safeHead (x : _) = Just x

myEnumFromTo :: (Eq a, Enum a) => a -> a -> [a]
myEnumFromTo x y 
  | x == y = [x]
  | otherwise = [x] ++ myEnumFromTo (succ x) y

filterLower :: String -> String
filterLower = filter isUpper

capFirst :: String -> String
--capFirst xs = (:) (toUpper (head xs)) (tail xs) 
capFirst xs =  ((:) . toUpper . head $ xs) $ tail xs 


capAll :: String -> String
capAll [] = []
capAll xs = (:) (toUpper (head xs)) (capAll $ tail xs) 

myHead :: String -> Char
myHead = toUpper . head 
