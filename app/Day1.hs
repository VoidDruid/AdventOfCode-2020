module Day1 where

import Data.Maybe
import Advent

findSum :: Int -> [Int] -> Maybe (Int, Int)
findSum target ints = case mapMaybe (
    \i -> if (target - i) `elem` ints 
        then Just (i, target - i)
        else Nothing
    ) ints of
        [] -> Nothing
        l -> Just (head l)


solver1 inputLines = 
    let
        intList = toInts inputLines
    in
        case findSum 2020 intList of
            Just (x, y) -> Just (x * y)
            Nothing -> Nothing


solver2 inputLines = 
    let
        intList = toInts inputLines
        sums = [ (x, y, z) | x <- intList, y <- intList, z <- intList, x + y + z == 2020]
    in
        case sums of [] -> Nothing ; ((x, y, z):_) -> Just (x * y * z)
