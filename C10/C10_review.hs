-- Chapter 10.10 Exercises

-- 1)
stops = "pbtdkg"
vowels = "aeiou"

-- a)
stopVS = [(x,y,z) | x <- stops, y <- vowels, z <- stops]
-- b)
stopVS' = [(x,y,z) | x <- stops, y <- vowels, z <- stops, x == 'p']
-- c)
nouns = ["Brent", "Anara", "Kitty", "Haskell", "awesome"]
verbs = ["likes", "is", "pokes"]
nounVN = [(x,y,z) | x <- nouns, y <- verbs, z <- nouns]


-- 2) Divides the sum of the number of characters in a string (spaces
-- excluded) by the number of words
seekritFunc :: String -> Int
seekritFunc x =
  div (sum (map length (words x)))
      (length (words x))

-- 3)
seekritFunc' :: Fractional a => String -> a
seekritFunc' x =
  fromIntegral (sum (map length (words x))) /
  fromIntegral (length (words x))
