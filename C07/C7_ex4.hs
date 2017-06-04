-- Chapter 7.7 Exercises
-- What value results from further applications.
-- Types not provided, fill in

dodgy :: Int -> Int -> Int
dodgy x y = x + y * 10

oneIsOne :: Int -> Int
doneIsOne == dodgy 1

oneIsTwo :: Int -> Int
oneIsTwo = flip dodgy 2
