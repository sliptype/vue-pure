module State.Board where

import Prelude

import State.Entity (Entity(..), addInstance, entity)
import State.Board.List (List, list)
import State.Board.Item (Item)

type State =
  { list :: Entity List
  , item :: Entity Item
  }

initialState :: State
initialState =
  { list: entity
      # addInstance "0" (list "Todo")
      # addInstance "1" (list "Doing")
      # addInstance "2" (list "Done")
  , item: entity
  }

