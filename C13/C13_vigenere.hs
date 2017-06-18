module Vigenere where

import Data.Char

chrRg :: Int
chrRg = length ['A'..'Z']

encode :: Char -> Int
--encode c = ord c - ord 'A' 
encode = subtract (ord 'A') . ord . toUpper

decode :: Int -> Char
decode = chr . (ord 'A' +)

shiftr :: Char -> Char -> Char
shiftr c k = decode $ mod (encode c + encode k) chrRg

shiftl :: Char -> Char -> Char
shiftl c k = decode $ mod (encode c - encode k) chrRg

--shift :: (Int -> Int -> Int) -> Char -> Char -> Char
--shift f c k = decode $ mod (f (encode c) (encode k)) chrRg

vigenere :: String -> String -> String
vigenere = vigProc' shiftr 

unVigenere :: String -> String -> String
unVigenere = vigProc' shiftl  

vigProc :: (Char -> Char -> Char) -> (String -> String -> String)
vigProc _ [] _ = []
vigProc s (c:cs) (k:ks)
  | isLetter c = s c k : vigProc s cs ks
  | otherwise =  c : vigProc s cs (k:ks)

vigProc' :: (Char -> Char -> Char) -> (String -> String -> String)
vigProc' s cs = vigProc s cs . cycle


main :: IO ()
main = do
  putStr $ "Message: "
  message <- getLine
  putStr $ "Code: "
  code <- getLine
  putStrLn $ "Secret message: " ++ vigenere message code

unMain :: IO ()
unMain = do
  putStr $ "Secret message: "
  message <- getLine
  putStr $ "Code: "
  code <- getLine
  putStrLn $ "Message: " ++ unVigenere message code

 
