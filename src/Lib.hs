module Lib
    ( runGame
    ) where

import QuizGame

intro :: IO ()
intro = putStrLn "Welcome to TBD GAME NAME, let's play a game!"

endGame :: IO ()
endGame = putStrLn "Thanks for playing!"

runGame :: IO ()
runGame = do
  intro
  startNewGame
  endGame
