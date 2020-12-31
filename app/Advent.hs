module Advent where

toInts = map (\a -> read a :: Int)

eachN _ [] = []
eachN n as  = head as : eachN n (drop n as)