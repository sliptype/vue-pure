module State where

import State.Counter as Counter
import State.Board as Board

type State =
  { counter :: Counter.State
  , board :: Board.State
  }

initialState :: State
initialState =
  { counter: Counter.initialState
  , board: Board.initialState
  }
