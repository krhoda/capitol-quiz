module QuizGame
  (
    startNewGame
  ) where

import QuizData
import System.Random

shuffle :: [a] -> IO [a]
shuffle target = if length target < 2
  then return target
  else do
    let maxBound = ((-) (length target) 1)
    sliceIndex <- randomRIO (0, maxBound)
    rest <- shuffle (take sliceIndex target ++ drop (sliceIndex+1) target)
    return (target!!sliceIndex : rest)

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
