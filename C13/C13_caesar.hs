-- Chapter 9 Ciphers
module Cipher where

import Data.Char

caesar :: String -> Int -> String
caesar "" _ = ""
caesar (x:xs) n = encode x n : caesar xs n
  
unCaesar :: String -> Int -> String
unCaesar "" _ = ""
unCaesar (x:xs) n = encode x (-n) : unCaesar xs n
  
encode :: Char -> Int -> Char
encode x n 
  | (+) (ord x) n > ord 'z' = chr ((+) (ord 'a') ((ord x) - (ord 'z' - n+1))) 
  | (+) (ord x) n < ord 'a' = chr ((-) (ord 'z') ((ord 'a'-n-1) -  (ord x)))
  | otherwise = chr ((+) (ord x) n)
-- | otherwise = (chr .) . (+) . ord

main :: IO ()
main = do
  putStr $ "Message: "
  message <- getLine
  putStr $ "How many steps? "
  step <- getLine
  putStrLn $ "Secret message: " ++ caesar message (read step :: Int)
