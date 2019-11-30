module Lib
    ( startNewGame
    ) where

import QuizData

intro :: IO ()
intro = putStrLn "Welcome to TBD GAME NAME, let's play a game!"

askForGame :: IO ()
askForGame = putStr ""

startNewGame :: IO ()
startNewGame = do
  intro
  askAll (createQuestions usStateList)

createQuestions :: [Entry] -> [IO ()]
createQuestions = map askAStupidQuestion

askAStupidQuestion :: Entry -> IO ()
askAStupidQuestion (reg, cap) = do
  putStrLn ("What is the capitol of " ++ reg ++ "?")
  x <- getLine
  putStrLn ("I hope your answer \"" ++ x ++ "\" is " ++ cap ++ ", because " ++ cap ++ " is the right answer.")

askAll :: [IO ()] -> IO ()
askAll [] = putStrLn "done"
askAll x = do
  head x
  askAll (tail x)
