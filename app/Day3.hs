module Day3 where

toMap :: [String] -> [[Int]]
toMap = map (\lineRaw -> [ if char == '#' then 1 else 0 | char <- cycle lineRaw])
iterLines mv (pos, s) line = (pos + mv, s + line !! pos)

solver1 inputLines =
    let
        treeMap = toMap inputLines
        (_, summary) = foldl (iterLines 3) (0, 0) treeMap
    in
        Just summary

solver2 inputLines =
    let
        treeMap = toMap inputLines
        patterns = 
            [ (1, 1)
            , (3, 1)
            , (5, 1)
            , (7, 1)
            , (1, 2) ]
        eachN _ [] = []
        eachN n as  = head as : eachN n (drop n as)
        countSum (right, down) = foldl (iterLines right) (0, 0) (eachN down treeMap)
    in
        Just (product $ map (snd . countSum) patterns)