-- Quicksort in Haskell
module Main where

qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x : xs) =
    let smaller = qsort'[a | a <- xs, a <= x]
        bigger = qsort'[a | a <- xs, a > x]
    in smaller ++ [x] ++ bigger

main :: IO ()
main = do
    putStrLn $("QuickSort Test1:\t" ++ show(qsort [10,9,8,7,6,5,4,3,2,1]))
    putStrLn $("QuickSort Test2:\t" ++ show(qsort [10,2,3,4,5,6,7,8,9,1]))
    putStrLn $("QuickSort Test3:\t" ++ show(qsort [10,9,8,7,6,1,2,3,4,5]))
    putStrLn $("QuickSort Test4:\t" ++ show(qsort [1,2,3,4,5,10,9,8,7,6]))
    putStrLn $("QuickSort Test5:\t" ++ show(qsort ['z','y','x','w','v','u','t','s','r','q']))