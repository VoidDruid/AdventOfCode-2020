module Main where

import System.Environment (getArgs)

import Data.List.Split

import qualified Day1 (solver1)

solvers = 
    [ [ Day1.solver1 ]
    ]

getFilePath filename = "data/" ++ filename ++ ".txt"
getSolverData dayNum = if '.' `elem` dayNum
    then
        let 
            [day, task] = splitOn "." dayNum
            dayIndex = (read day :: Int)
            taskIndex = (read task :: Int)
        in
            (dayIndex - 1, taskIndex - 1, getFilePath $ show dayIndex ++ "." ++ show taskIndex)
    else
        ((read dayNum :: Int) - 1, 0, getFilePath $ dayNum ++ ".1")


main :: IO ()
main = do
    args <- getArgs
    let (dayIndex, solverIndex, dataFile) = case args of
            [dayNum] -> getSolverData dayNum
            [dayNum, filename] -> 
                let
                    (dayI, solverI, _) = getSolverData dayNum
                in 
                    (dayI, solverI, getFilePath filename)
    content <- readFile $ dataFile
    let inputLines = lines content
    print $ (solvers !! dayIndex !! solverIndex ) inputLines
