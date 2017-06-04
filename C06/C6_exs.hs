-- Chapter Exercies
import Data.List
-- Multiple Choice
-- 1) The Eq class
--   c) makes equality tests possible

-- 2) The typeclass Ord
--   b) is a subclass of Eq

-- 3) Suppose the typeclass Ord has an operator >. Type of > is
--   a) Ord a => a -> a -> Bool

-- 4) In x = divMod 16 12
--   c) the type of x is a tuple

-- 5) The typeclass Integral includes
--   a) Int and Integer numbers


--Does it typecheck?

-- 1; doesn't typecheck because Bool has no instance of Show
data Person = Person Bool deriving Show

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)


-- 2; Does not typecheck because no instance for Eq Mood
data Mood = Blah
          | Woot deriving (Show, Eq)

settleDown x =
  if   x == Woot
  then Blah
  else x


-- 3;
-- a) Only Moods are accepted types
-- b) settleDown has no instance of Num, which is required for 9
-- c) no instance of Ord in Mood for > operator


-- 4; Will typecheck
type Subject = String
type Verb = String
type Object = String

data Sentence =
  Sentence Subject Verb Object
  deriving (Eq, Show)

s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"


-- Given a datatype declaration, what can we do?
data Rocks =
  Rocks String deriving (Eq, Show)

data Yeah =
  Yeah Bool deriving (Eq, Show)

data Papu =
  Papu Rocks Yeah
  deriving (Eq, Show)

-- Which of the following will typecheck? Why not if so?
-- 1; Needs data declaration for "chases" and True
phew = Papu (Rocks "chases") (Yeah True)


-- 2; Will typecheck
truth = Papu (Rocks "chomskydoz") (Yeah True)


-- 3; Should typecheck..
equalityForall :: Papu -> Papu -> Bool
equalityForall p p' = p == p'


-- 4; Needs Ord instance for >
-- comparePapus :: Papu -> Papu -> Bool
-- comparePapus p p' = p > p'


-- Match the types
-- 1)
i :: Num a => a
i = 1
-- i :: a will not typecheck, needs Num instance


-- 2)
f2 :: Float
f2 = 1.0
-- f :: Num a => a will not typecheck, 1.0 is a Fractional type


-- 3)
f3 :: Fractional a => a
f3 = 1.0

-- f :: Fractional a => a will typecheck


-- 4)
f4 :: RealFrac a => a
f4 = 1.0
-- f :: RealFrac a => a will typecheck, has instance of Fractional for 1.0


-- 5)
freud :: Ord a => a -> a
freud x = x
-- freud :: Ord a => a -> a will typecheck, is subtype of Eq


-- 6)
freud' :: a -> a
freud' x = x
-- freud' :: Int -> Int will typecheck


-- 7)
myX = 1 :: Int

sigmund :: Int -> Int
sigmund x = myX
-- sigmund :: a -> a will not typecheck, a is too general


-- 8)
myX' = 1 :: Int

sigmund' :: Int -> Int 
sigmund' x = myX
-- sigmund' :: Num a => a -> a won't typecheck, Int more specific, so must be Int


-- 9)
jung :: [Int] -> Int
jung xs = head (sort xs)
-- jung :: [Int] -> [Int] has an instance of Ord, which is called by sort
-- should typecheck


-- 10)
young :: [Char] -> Char
young xs = head (sort xs)
-- young :: Ord a => [a] -> a..same as previous question start? Will typecheck

-- 11)
mySort :: [Char] -> [Char]
mySort = sort

signifier :: [Char] -> Char
signifier xs = head (mySort xs)
-- signifier :: Ord a => [a] -> a won't typecheck. mySort demands Char
-- specifically, Ord a is more general


--Type-Kwon-Do

-- 1)
chk :: Eq b => (a -> b) -> a -> b -> Bool
chk f a b = f a == b


-- 2) Hint: use some arithmetic operation to combine values of type 'b'.
arith :: Num b => (a -> b) -> Integer -> a -> b
arith f a b = fromInteger a + f b
