module QuizGame
  (
    startNewGame
  ) where

import QuizData
import System.Random

-- shuffle :: [a] -> IO a]
shuffle x = if length x < 2
  then return x
  else do
    i <- System.Random.randomRIO (0, length (x)-1)
    r <- shuffle (take i x ++ drop (i+1) x)
    return (x!!i : r)

createGameDesc :: Game -> String
createGameDesc (label, gameName, _) = "#" ++ label ++ ") Do you want to play " ++ gameName ++ "?\n"

showGames :: String
showGames = concatMap createGameDesc gameList

createHCGamePlay :: [Entry] -> [IO ()]
createHCGamePlay = map askHCQuestion

askHCQuestion :: Entry -> IO ()
askHCQuestion (reg, cap) = do
  putStrLn ("What is the capitol of " ++ reg ++ "?")
  x <- getLine
  putStrLn ("I hope your answer \"" ++ x ++ "\" is " ++ cap ++ ", because " ++ cap ++ " is the right answer.")

askAll :: [IO ()] -> IO ()
askAll [] = putStrLn "done"
askAll x = do
  head x
  askAll (tail x)

playGame :: [Entry] -> IO ()
playGame x = do
  shuffled <- shuffle (createHCGamePlay x)
  askAll shuffled

-- TODO: REMOVE HARDCODING
readGameChoice :: String -> IO ()
readGameChoice "1" = playGame usStateList

readGameChoice "2" = playGame canadianList

readGameChoice _ = do
  putStrLn "I Don't Understand, please type 1 or 2"
  startNewGame

startNewGame :: IO ()
startNewGame = do
  putStrLn showGames
  putStrLn "Please type the number of the game you would like to play"
  x <- getLine
  readGameChoice x
