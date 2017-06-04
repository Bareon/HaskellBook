-- Chapter 11.10 Exercises
--data FlowerType = Gardenia
--                | Daisy
--                | Rose
--               | Lilac
--                deriving Show

type Gardener = String

--data Garden =
--  Garden Gardener Flowertype
--  deriving Show

-- Garden normal form
data Garden =
    Gardenia Gardener
  | Daisy Gardener
  | Rose Gardener
  | Lilac Gardener
  deriving Show
