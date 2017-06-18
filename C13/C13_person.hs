-- Chapter 13 Exercises - Person

type Name = String
type Age = Integer

data Person = Person Name Age deriving Show

data PersonInvalid = NameEmpty
                   | AgeTooLow
                   | PersonInvalidUnknown String
                   deriving (Eq, Show)

mkPerson :: Name -> Age -> Either PersonInvalid Person
mkPerson name age
  | name /= "" && age > 0 = Right $ Person name age
  | name == "" = Left NameEmpty
  | not (age > 0) = Left AgeTooLow
  | otherwise = Left $ PersonInvalidUnknown $
      "Name was: " ++ show name ++
      "Age was: " ++ show age

gimmePerson :: IO ()
gimmePerson = do
  putStr "Name: "
  name <- getLine
  putStr "Age: "
  age <- getLine
  case mkPerson name (read age :: Integer) of
    Right p -> putStrLn $ "Yay! Successfully got a person: " ++ show p
    Left NameEmpty -> putStrLn "Empty name"
    Left AgeTooLow -> putStrLn "Age must be greater than 0"
    Left (PersonInvalidUnknown s) -> putStrLn $ "Unknown: " ++ s
