-- Chapter 11 Exercises, as-patterns
import Data.Char
-- 1) Should return True iff all values in first list appear in second
isSubsequenceOf :: (Eq a) => [a] -> [a] -> Bool
isSubsequenceOf [] _ = True
isSubsequenceOf _ [] = False
isSubsequenceOf seq1@(x:xs) seq2@(y:ys) =
  ( any (elem x) [seq2] && isSubsequenceOf xs seq2) 


-- 2) Split a sentence into words, then tuple each word with capitalized
-- form of each.
capitalizeWords :: String -> [(String, String)]
capitalizeWords "" = []
capitalizeWords xs = map tup (words xs)
    where
      tup seq1@(x:xs) = (seq1, toUpper x : xs)

