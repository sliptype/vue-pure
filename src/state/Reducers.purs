module State.Reducers
  ( addList
  , addItem
  , increment
  ) where

import Prelude

import State.Model (State, findListIndex)
import State.Board (addList, addItem)
import State.Counter (increment)

type Reducer a b = a -> b -> a

type Reducable a b =
  { reducer :: Reducer a b
  , initialState :: a
  }

{
  s :: Reducable a b
}
->
{
  s :: a
}

getInitialState :: 
combineReducers :: Object Reducer


