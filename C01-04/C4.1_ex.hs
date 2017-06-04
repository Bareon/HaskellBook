--Ch. 4.1 Exercises
data Mood = Blah | Woot deriving Show

--1. What is the type constructor, or name of this type?
--Mood

--2. If the function requires a Mood value, what are the
--values you could possible use there?
--Blah or Woot deriving Show

--3. We are trying to write a function changeMood to change
--Chris's mood instantaneously. So far, we've written a type
--signature changeMood :: Mood -> Woot. What's wrong with that?
--Mood and Woot are data constructors, not type constructors.

--4. Now we want to write the function that changes his mood.
--Given an input mood, it gives us the other one. Fix any mistakes
--and complete the function

changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood    _ = Blah
