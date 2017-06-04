-- Chapter 12 Exercises - Either library

lefts' :: [Either a b] -> [a]
lefts' = foldr left []
  where
    left (Left a) as = a:as
    left (Right _) as = as

rights' :: [Either a b] -> [b]
rights' = foldr right []
  where
    right (Right b) bs = b:bs
    right (Left a) bs = bs

partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' = foldr partition ([],[])
 where
   partition (Left a) (as, bs) = (a:as, bs)
   partition (Right b) (as, bs) = (as, b:bs)

eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' _ (Left _) = Nothing
eitherMaybe' f (Right b) = Just $ f b

either' :: (a -> c) -> (b -> c) -> Either a b -> c
either' f _ (Left a) = f a
either _ g (Right b) = g b

eitherMaybe'' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe'' f = either' (const Nothing) (Just . f)
