module State.Model
 (createStore)
 where

import Prelude
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Redux as Redux

import State.Entity (Entity, addInstance, entity)
import State.List (List, list)
import State.Item (Item)
import State.Counter as Counter

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

-- TODO: Can't know initial state type here
createStore :: Effect Redux.Store
createStore = Redux.createStore Counter.reducer (Counter.reducer 0 { "type": "init", "value": 0 })

