-- Chapter 11.7 Exercises
data Example = MakeExample deriving Show

-- 1) MakeExample :: Example, Example isn't a data constructor, can't :t
-- 2) Shows type constructor information and instances

-- 3)
data Example' = MakeExample' Int deriving Show
-- changes to MakeExample' :: Int -> Example'
