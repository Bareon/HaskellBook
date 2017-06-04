-- Chapter 10.9 exercises

-- Original functions from C8
fibonacci :: Integral a => a -> a
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci x = fibonacci (x -1) + fibonacci (x -2)

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- 1)
fibs  = take 20 $ 1 : scanl (+) 1 fibs
fibsN x = fibs !! x

-- 2)
fibs' = filter (<100) $ 1 : scanl (+) 1 fibs
fibs'' = takeWhile (<100) $ 1 : scanl (+) 1 fibs

-- 3)
factorial' = scanl (*) 1 [2..]
factN x  = take x $ factorial'
