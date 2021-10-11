module Main where

maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x:xs)
  | x > maxTail = x
  | otherwise = maxTail
  where maxTail = maximum' xs

maximum'' :: (Ord a) => [a] -> a
maximum'' [] = error "maximum of empty list"
maximum'' [x] = x
maximum'' (x:xs) = max x (maximum'' xs)

replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n x
  | n <= 0 = []
  | otherwise = x:replicate' (n-1) x

take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
  | n <= 0 = []
take' _ [] = []
take' n (x:xs) = x: take' (n-1) xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

-- Infinite recursion
repeat' :: a -> [a]
repeat' x = x:repeat' x

zip' :: [a] -> [b] -> [(a,b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x, y):zip' xs ys

elem' :: (Eq a) => a -> [a] -> Bool
elem' a[] = False
elem' a(x:xs)
  | a == x = True
  | otherwise = a `elem'` xs

main :: IO ()
main = do
  putStrLn $("maximum':\t" ++ show(maximum' [1,2,3,4,100]))
  putStrLn $("maximum'':\t" ++ show(maximum'' [1,2,3,4,100]))
  putStrLn $("replicate:\t" ++ show(replicate' 5 10))
  putStrLn $("take:\t\t" ++ show(take' 3 [5,4,3,2,1]))
  putStrLn $("reverse:\t" ++ show(reverse' [1,2,3,4,5]))
  putStrLn $("repeat:\t\t" ++ "Infinity")
  putStrLn $("zip:\t\t" ++ show(zip[1,2,3] [4,5,6,7]))
  putStrLn $("elem:\t" ++ show(elem' 5 [1,2,3,4,5]))
