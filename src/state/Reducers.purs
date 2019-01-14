module State.Reducers where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Data.Array (length)
import Foreign.Object (insert)

import State.Model (State, emptyList, item)

type Reducer a = State -> a -> State

addList :: Reducer String
addList s name =
  let newId = show $ length s.listIds
      newList = emptyList name
  in
    s {
      listsById = insert newId newList s.listsById
    }


