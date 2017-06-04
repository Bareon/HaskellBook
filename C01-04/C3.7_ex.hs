--Chapter 3.7 Exercises
--

exclaim x = x ++ "!"

takeFourth x = x !! 4

dropNine x = drop 9  x 

thirdChar :: String -> Char
thirdChar x = x !! 2

letterIndex :: Int -> Char
letterIndex x = string !! x
  where
   string = "Brent is an amazing dude!"
