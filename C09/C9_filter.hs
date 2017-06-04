-- Chapter 9.10 Exercises
multThrees ::  (Integral a) => [a] -> [a]
multThrees = filter (\x -> rem x 3 == 0)  
                    
lenMultThrees :: (Integral a) => [a] -> Int
lenMultThrees = length . multThrees

myFilter :: String -> [String]
myFilter xs = [x | x <- words xs, x /= "the", x /= "a", x /= "an"] 
