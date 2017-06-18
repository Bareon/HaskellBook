-- Chapter 13 Exercises - Palindrome

import Control.Monad (forever)
import System.Exit (exitSuccess)
import Data.Char (toLower, isLetter)

palProc :: String -> String
palProc [] = ""
palProc (c:cs)
  | isLetter c = toLower c : palProc cs
  | otherwise  = palProc cs
  
palindrome :: IO ()
palindrome = forever $ do
  line1 <- getLine
  case ((palProc line1) == (reverse . palProc $ line1)) of
    True ->  putStrLn "It's a palindrome!"
    False -> do
      putStrLn "Nope!"
      exitSuccess
