module Lib
    ( startNewGame
    ) where

intro :: IO ()
intro = putStrLn "Welcome to TBD GAME NAME, let's play a game!"

startNewGame :: IO ()
startNewGame = do
  intro
  askAll (createQuestions [("Colorado", "Denver"),("Wyoming", "Cheyanne"),("Arizona", "Phoenix")])

createQuestions :: [Entry] -> [IO ()]
createQuestions x = map askAStupidQuestion x

askAStupidQuestion :: Entry -> IO ()
askAStupidQuestion (reg, cap) = do
  putStrLn ("What is the capitol of " ++ reg ++ "?")
  x <- getLine
  putStrLn ("I hope your answer \"" ++ x ++ "\" is " ++ cap ++ ", because " ++ cap ++ " is the right answer.")

askAll :: [IO ()] -> IO ()
askAll [] = putStrLn "done"
askAll x = do
  (head x)
  askAll (tail x)

type Capitol = String
type Region = String
type Entry = (Region, Capitol)
