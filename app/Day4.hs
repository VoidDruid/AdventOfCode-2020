module Day4 where

import Advent

data Passport = Passport { birthYear :: String  
                         , issueYear :: String  
                         , expiration :: Int  
                         , height :: Float  
                         , hair :: String  
                         , eye :: String 
                         , passportId :: String
                         , countryId :: String 
                         } deriving (Show)

requiredFields = 
    [ "byr"
    , "iyr"
    , "eyr"
    , "hgt"
    , "hcl"
    , "ecl"
    , "pid"
    , "cid"
    ]
