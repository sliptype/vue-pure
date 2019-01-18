module State.Model where

import Prelude

import State.Entity (Entity, entity)
import State.List (List)
import State.Item (Item)

type State =
  { list :: Entity List
  , item :: Entity Item
  }

initialState :: State
initialState =
  { list: entity
  , item: entity
  }
