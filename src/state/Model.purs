module State.Model where

import Prelude
import State.Board (State, initialState) as Board
import State.Counter (State, initialState) as Counter

type State =
  { counter :: Counter.State
  , board :: Board.State
  }

type Reducer a = State -> a -> State

initialState :: State
initialState =
  { board: Board.intialState
  , counter: Counter.initialState
  }

reducer ::
  composeReducers
  { board: Board.reducers
  , counter: Counter.reducers
  }
