module Day2 where

import Debug.Trace
import Data.List.Split

parseLine line =
    let
        [rule, pass] = splitOn ": " line
        [count, letter] = splitOn " " rule
        [minC, maxC] = map (read :: String -> Int) $ splitOn "-" count
    in
        (minC, maxC, head letter, pass)

checkLineV1 line = 
    let
        (minC, maxC, letter, pass) = parseLine line
        occurances = foldl (\counter l -> if l == letter then counter + 1 else counter) 0 pass
    in
        if minC <= occurances && occurances <= maxC
            then 1
            else 0 

checkLineV2 line = 
    let
        (firstC, secondC, letter, pass) = parseLine line
        occurances = foldl (\counter place -> if pass !! (place - 1) == letter then counter + 1 else counter) 0 [firstC, secondC]
    in
        if occurances == 1
            then 1
            else 0 


solver1 inputLines = Just $ sum (map checkLineV1 inputLines)

solver2 inputLines = Just $ sum (map checkLineV2 inputLines)