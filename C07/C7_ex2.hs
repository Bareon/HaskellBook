-- Chapter 7.5 exercises

-- 1) Given the following declarations
k (x, y) = x
k1 = k ((4-1), 10)
k2 = k ("three", (1+2))
k3 = k (3, True)

-- a) What is the type of k? (a,b) -> a
-- b) What is the type of k2? [Char], not same type as k1, k2
-- c) k3 will return number 3


-- 2) Fill in the definition of the following function
-- Remember: Tuples have same syntax for their type
-- constructors and their data constructors

f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
f (a, b, c) (d, e, f) = ((a, d), (c, f))
