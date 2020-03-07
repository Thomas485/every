module Main (main) where

import System.Environment (getArgs)
import qualified Data.ByteString.Lazy.Char8 as C

every :: [a]->Int->[a]
every as j = case drop j as of
  (r:rs)->r:every rs j
  _->[]

everyBlock :: [a]->Int->Int->[a]
everyBlock as j k = case drop j as of
  q@(r:rs)->take k q++everyBlock (drop k q) j k
  _->[]

main :: IO ()
main = getArgs >>= \args->
  C.getContents>>= \cont->
  case args of
    []       -> interact id
    (a:b:[]) -> mapM_ C.putStrLn $ everyBlock (C.lines cont) ((read a::Int)-1) (read b::Int)
    (a:_)    -> mapM_ C.putStrLn $ every (C.lines cont) ((read a::Int)-1)
