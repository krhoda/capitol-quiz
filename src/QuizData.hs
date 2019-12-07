module QuizData
    ( Capitol,
      Region,
      Entry,
      Game,
      usStateList,
      canadianList,
      gameList,
    ) where
import Data.Data

type Capitol = String
type Region = String
type Entry = (Region, Capitol)
type GameData = [Entry]

type GameDisplay = String

-- TODO: Get more thoughtful.
type GameLabel = String

type Game = (GameLabel, GameDisplay, GameData)
-- TODO MAKE THIS MORE EXTENSIBLE:
-- data GameName = "US States" | "Canadian" deriving (Ord, Eq, Enum, Bounded)

usStateList :: [Entry]
usStateList = [("Alabama", "Birmingham")
              ,("Arizona", "Pheonix")
              ,("Colorado", "Denver")]


canadianList :: [Entry]
  -- TODO: MAKE QUEBEC ALSO ACCEPT QUEBEC CITY
canadianList = [("Quebec", "Quebec City")
               ,("Newfoundland and Labrador", "St. John's")
               ,("Nova Scotia", "Halifax")
               ,("New Brunswick", "Fredericton")
               ,("Prince Edward Island", "Charlottetown")
               ,("Ontario", "Toronto")
               ,("Manitoba", "Winnipeg")
               ,("Saskatchewan", "Regina")
               ,("Alberta", "Edmonton")
               ,("British Columbia", "Victoria")
               ,("Nunavut", "Iqaluit")
               ,("Northwest Territories", "Yellowknife")
               ,("Yukon", "White Horse")]

gameList :: [Game]
gameList = [("1", "US", usStateList), ("2", "Canadian", canadianList)]
