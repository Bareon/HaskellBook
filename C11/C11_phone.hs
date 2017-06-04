-- Chapter 11 Phone exercise

data Phone =
  Phone { key :: Char
        , chrs :: String
        }
        deriving (Eq, Ord, Show)

one    = Phone '1' "1"
two    = Phone '2' "abc2"
three  = Phone '3' "def3"
four   = Phone '4' "ghi4"
five   = Phone '5' "jkl5"
six    = Phone '6' "mno6"
seven  = Phone '7' "pqrs7"
eight  = Phone '8' "tuv8"
nine   = Phone '9' "wxyz9"
zero   = Phone '0' " "
star   = Phone '*' "^*"
crunch = Phone '#' ".,"

convo :: [String]
convo = ["Wanna play 20 questions",
         "Ya",
         "U 1st haha",
         "Lol ok. Have u ever tasted alcohol lol",
         "Lol ya",
         "Wow ur cool haha. Ur turn",
         "Ok. Do u think I am pretty Lol",
         "Lol ya",
         "Haha thanks just making sure rofl ur turn"]

-- validButtons = "1234567890*#"
type Digit = Char

-- valid presses = [1..4]
type Presses = Int

reverseTaps :: Phone -> Char -> [(Digit, Presses)]
reverseTaps = undefined
-- assuming default phone definition
-- 'a' -> ('2', 1)
-- 'A' -> [('*',1), ('2', 1)]

cellPhonesDead :: Phone -> String -> [(Digit, Presses)]
cellPhonesDead = undefined
