-- Chapter 12 Exercises - Validate the word

import Data.Char

newtype Word' =
  Word' String
  deriving (Eq, Show)

vowels = "aeiou"

mkWord :: String -> Maybe Word'
mkWord s = case countVowels s > div (length s) 2 of
  True  -> Nothing
  False -> Just $ Word' s
  

isVowel :: Char -> Bool
isVowel = flip elem "aeiou" . toLower 

countVowels :: String -> Int
countVowels = length . filter (==True) . map isVowel
  
