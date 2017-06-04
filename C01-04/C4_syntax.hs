{-# LANGUAGE TemplateHaskell #-}
--1. add 1 to length of string argument
x = (+)
f xs = x w 1
 where w = length xs

--2. identity function, id
idF = \x -> x

--3. first value of list
hdF = \(x : xs) -> x

--4. first value from tuple
fstF (a,b) = fst (a,b) 
