sayHello :: String -> IO ()
sayHello x = putStrLn ("Hello, " ++ x ++ "!")

triple x = x * 3
pir2 x = 3.14 * (x * x)

mult1 = x * 3 + y
 where
  x = 3 
  y = 1000

waxon = x * 5
 where
  z = 7
  y = z + 8
  x = y ^ 2

waxOff x = triple x - 13 

--area d = pi * (r * r)
--r = d / 2

area' d' = pi * (r' * r')
 where
  r' = d' / 2

f :: PlatonicSolid -> Int
f x = case x of
 
 Cube -> 2
 Octahedron -> 3
 Dodecahedron -> 4
 Icosahedron -> 5
