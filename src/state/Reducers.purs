module State.Reducers where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Data.Array ((:), length)
import Data.Maybe (Maybe(..))
import Foreign.Object (Object(..), lookup, insert)

import State.Model (State, emptyList, item, addItemToList)

type Reducer a = State -> a -> State

type ItemAddition =
  { id:: String
  , name :: String
  }

addList :: Reducer String
addList s name =
  let newId = show $ length s.listIds
      newList = emptyList name
  in
    s
    { listIds = newId : s.listIds
    , listsById = insert newId newList s.listsById
    }

addItem :: Reducer ItemAddition
addItem s { id, name } =
  let newId = show $ length s.itemIds
      newItem = item name
      list = lookup id s.listsById
  in
  case list of
    Nothing -> s
    Just l ->
      let newList = addItemToList newId l
      in
      s { itemIds = newId : s.itemIds
        , itemsById = insert newId newItem s.itemsById
        , listsById = insert id newList s.listsById
        }
