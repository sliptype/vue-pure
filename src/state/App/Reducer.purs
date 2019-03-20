module State.Reducer
  ( Reducer
  , initialAction
  , withInitialState
  ) where

import Data.Maybe

-- Reducer is a function that:
-- Takes:
--   an action of type b
--   a state of type a
-- Returns:
--   a state of type a
type Reducer a b = b -> a -> a

-- Wraps a reducer
-- Returns a function that takes a Maybe action and returns either the new state or initial state
withInitialState :: forall a b. (Reducer a b) -> a -> (Maybe b) -> a -> a
withInitialState _ initialState Nothing _ = initialState
withInitialState reducer _ (Just action) state = reducer action state

-- Re-exporting 'Nothing' as the initial action
-- this allows all sliced reducers to handle their
-- initial state when a root reducer is initialized
initialAction :: forall a. Maybe a
initialAction = Nothing
