-- Chapter 12 Exercies - My iterate, unfoldr

-- 1)
myIterate :: (a -> a) -> a -> [a]
myIterate f x = x : myIterate f (f x)  

-- 2)
myUnfoldr :: (b -> Maybe (a, b)) -> b -> [a]
myUnfoldr f b = case f b of
  Nothing      -> []
  Just (a, b') -> a : myUnfoldr f b'

-- 3)
betterIterate :: (a -> a) -> a -> [a]
betterIterate f x = myUnfoldr (\a -> Just (a, f a)) x


-- Binary Trees
data BinaryTree a =
    Leaf
  | Node (BinaryTree a) a (BinaryTree a)
  deriving (Eq, Ord, Show)

-- 1)
unfold :: (a -> Maybe (a,b,a)) -> a -> BinaryTree b
unfold f b = case f b of
  Nothing -> Leaf
  Just (a, b',a') -> Node (unfold f a) b' (unfold f a)


-- 2)
treeBuild :: Integer -> BinaryTree Integer
treeBuild n = unfold go 0 
  where
    go m
      | m == n = Nothing
      | otherwise = Just (m+1, m, m+1)

