-- Chapter 10.5 Exercises

-- 1) foldr (*) 1 [1..5] returns same as:
-- c) foldl (*) 1 [1..5]

-- 2) foldl (flip (*)) 1 [1..3]
-- (flip (*)) 1 (foldl (flip (*)) 1 [2,3])
-- (flip (*)) 1 ((flip (*)) 2 (foldl (flip (*)) 1 [3]))
-- (flip (*)) 1 ((flip (*)) 2 ((flip (*) 3 (foldl (flip (*)) 1 []))))
-- (flip (*)) 1 ((flip (*)) 2 ((flip (*) 3 (1))))
-- (flip (*)) 1 ((flip (*)) 2 (3))
-- (flip (*)) 1 (6))
-- 6

-- 3) One difference between foldr and foldl is:
-- c) foldr, but not foldl, associates to the right

-- 4) Folds are catamorphisms, which means they are generally used to
-- a) reduce structure

-- 5)
a = foldr (++) "" ["woot", "WOOT", "woot"]
b = foldr max [] ["fear is the little death"]
c = foldr (&&) True [False, True]
d = foldr (||) False [False, True]
e = foldl (flip ((++) . show)) "" [1..5]
f = foldr (flip const) 'a' [1..5]
g = foldr (flip const) 0 "tacos"
h = foldl const 0 "burritos"
i = foldl const 'z' [1..5]
