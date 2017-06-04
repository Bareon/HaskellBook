-- Chapter 10.6 Exercises
import Data.Time

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
  [ DbDate (UTCTime
           (fromGregorian 1911 5 1)
           (secondsToDiffTime 34123))
  , DbString "Hello, world!"
  , DbDate (UTCTime
           (fromGregorian 1921 5 1)
           (secondsToDiffTime 34123))
  ]


-- 1)
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate db = [t | (DbDate t) <- db]

-- 2)
filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber db = [n | (DbNumber n) <- db]

-- 3)
mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = maximum . filterDbDate

-- 4)
sumDb :: [DatabaseItem] -> Integer
sumDb = sum . filterDbNumber

-- 5)
avgDb :: [DatabaseItem] -> Double
avgDb db = (fromIntegral . sumDb $ db) /
           (fromIntegral . length $ db)
