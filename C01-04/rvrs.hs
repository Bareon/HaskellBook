--Ch. 3.7 Exercise #5
--rvrs module
module Reverse where

rvrs :: String -> String
rvrs x = drop 9 x ++ " " ++ (drop 6(take 9 x)) ++ take 5 x

main :: IO ()
main = print $ rvrs "Nooch is awesome"
