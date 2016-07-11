module Meownicode (meowencode, meowdecode) where

import Data.Char (chr, ord)

{- Encoding -}
meowencode :: String -> [String]
meowencode x = concatMap meowencodeOne (map ord x)

meowencodeOne :: Int -> [String]
meowencodeOne n = encodeMeowNum (length l) $ meowEncodeWords l n []
	where
		l = meowFactors n

meowEncodeWords :: [Int] -> Int -> [String] -> [String]
meowEncodeWords []     nb l = l ++ [intToMeow nb]
meowEncodeWords (x:xs) 0  l = meowEncodeWords xs 0            (l ++ [intToMeow 0])
meowEncodeWords (x:xs) nb l = meowEncodeWords xs (nb `mod` x) (l ++ [intToMeow (nb `div` x)])

encodeMeowNum :: Int -> [String] -> [String]
encodeMeowNum nb (x:xs) = ('m' : take nb (cycle "e") ++ drop 1 x):map (\e -> "m" ++ e) xs

meowFactors :: Int -> [Int]
meowFactors nb
	| nb < 128 = []
	| otherwise = reverse $ takeWhile (< nb) (64:[64^2,64^3..])


{- Decoding -}
meowdecode :: [String] -> String
meowdecode l = meowdecode' l ""

meowdecode' :: [String] -> String -> String
meowdecode' [] r = r
meowdecode' (('c':'c':x):xs) r = meowdecode' xs r
meowdecode' (x:xs) r = meowdecode' (drop (nb+1) (x:xs)) (r ++ [chr (meowdecodeOne nb (take (nb+1) (x:xs)))])
	where
		nb = nbMeow x

meowdecodeOne :: Int -> [String] -> Int
meowdecodeOne nb l = foldl (\acc (n,i) ->  acc + adaptToPos (nb - i) n) 0 meowint
	where
		meowint = zip (map meowToInt l) [0,1..]

{- Utilities functions -}
nbMeow :: String -> Int
nbMeow ('m':'e':x) = countElem 'e' x

intToMeow :: Int -> String
intToMeow x = "meo" ++ take o (cycle "o") ++ "w" ++ take u (cycle "w")
	where (o,u) = x `divMod` 10

meowToInt :: String -> Int
meowToInt s =  10 * (countElem 'o' s - 1) + countElem 'w' s - 1

countElem :: (Eq a) => a -> [a] -> Int
countElem e = length . filter (== e)

adaptToPos :: Int -> Int -> Int
adaptToPos nb n = n * (2 ^ (6 * nb))
