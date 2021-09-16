-- MergeSort in Haskell
module Main where

merge :: Ord a => [a] -> [a] -> [a] -- merge two list in Haskell
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys) =
    if x < y
    then x: merge xs (y:ys)
    else y: merge ys (x:xs)

mergeSort :: Ord a => [a] -> [a] -- merge sort a list in Haskell
mergeSort []  = []
mergeSort [x] = [x]
mergeSort xs = merge (mergeSort left) (mergeSort right) 
    where   left = take partition xs
            right = drop partition xs
            partition = length xs `div` 2

main::IO ()
main = do
    putStrLn $("MergeSort1:\t" ++ show(mergeSort [10,9,8,7,6,5,4,3,2,1]))
    putStrLn $("MergeSort2:\t" ++ show(mergeSort [10,2,3,4,5,6,7,8,9,1]))
    putStrLn $("MergeSort3:\t" ++ show(mergeSort [10,9,8,7,6,1,2,3,4,5]))
    putStrLn $("MergeSort4:\t" ++ show(mergeSort [1,2,3,4,5,10,9,8,7,6]))
    putStrLn $("MergeSort5:\t" ++ show(mergeSort ['z','y','x','w','v','u','t','s','r','q']))