module QuizData
    ( Capitol,
      Region,
      Entry,
      usStateList
    ) where

type Capitol = String
type Region = String
type Entry = (Region, Capitol)

usStateList :: [Entry]
usStateList = [("Alabama", "Birmingham")
              ,("Arizona", "Pheonix")
              ,("Colorado", "Denver")]
