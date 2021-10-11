import Data.List
import Distribution.Simple.Utils (xargs)

search' :: (Eq a) => [a] -> [a] -> Bool
search' needle haystack =
    let nlen = length needle
    in foldl (\acc x -> if take nlen x == needle then True else acc) False (tails haystack)

sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs

elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldl (\acc x -> if x == y then True else acc) False ys

const x _ = x
main = do
    print "Hello Word"
    print (sum' [3, 5, 2, 1])
    print (search' [1,5] [1,5,6,7,8,9])
    print (foldr (+) 5 [1, 2, 3])
    print (foldr (-) 0 [1, 2, 3])
    print (foldl (+) 0 [1, 2, 3])
    print (foldl (-) 0 [1, 2, 3])
    print (foldl (-) 5 [1, 2, 3])
    print (foldr (+) 0 [1, 2, 3])
    print (a`b`c where a = "a" b = (++) c = "c")
    