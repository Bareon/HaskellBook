-- fibonnaci recursion function
fibonacci :: Integral a => a -> a
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci x = fibonacci (x -1) + fibonacci (x -2)

-- zipWith
fib = zipWith (+) (0:(1:fib)) (0:fib)
--print $ take 100 fib

dividedBy :: Integral a => a -> a -> (a,a)
dividedBy num denom = go num denom 0
  where go n   d count
         | n < d = (count, n)
         | otherwise = go (n - d) d (count + 1)
