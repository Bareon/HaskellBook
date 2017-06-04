-- Chapter 11.4 Exercises

data Doggies a =
    Husky a
  | Mastiff a
  deriving (Eq, Show)

data DogueDeBordeaux doge = DogueDeBordeaux doge

-- 1) Doggies is a type constructor
-- 2) Doggies :: * -> *
-- 3) Doggies String :: *
-- 4) Husky 10 :: Num a => Doggies a
-- 5) Husky (10 :: Integer) :: Doggies Integer
-- 6) Mastiff "Scooby Doo" :: Doggies [Char]
-- 7) both
-- 8) DogueDeBordeaux :: doge -> DogueDeBordeaux doge
-- 9) DogueDeBordeaux "doggie!" :: DogueDeBordeaux [Char]
