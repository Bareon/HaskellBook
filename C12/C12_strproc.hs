-- Chapter 12 Exercises - String Processing

import Data.Char

notThe :: String -> Maybe String
notThe "the" = Nothing
notThe s = Just s

replaceThe :: String -> String
replaceThe = unwords . map theIsA . words
  where theIsA s = case notThe s of
          Nothing -> "a"
          Just s -> s

countTV :: [String] -> Integer
countTV []                          = 0
countTV ("the":v:xs) | vowelStart v = countTV xs + 1
countTV (y:ys)                      = countTV ys

countTheBeforeVowel :: String -> Integer
countTheBeforeVowel = countTV . words

vowelStart :: String -> Bool
vowelStart = isVowel . head
  
isVowel :: Char -> Bool
isVowel = flip elem "aeiou" . toLower 

countVowelStart :: String -> Int
countVowelStart = length . filter (==True) . map vowelStart . words

countVowels :: String -> Int
countVowels = length . filter (==True) . map isVowel
