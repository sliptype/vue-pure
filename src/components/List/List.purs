module List.Connect where

import Prelude (Unit, ($))
import Data.Maybe (Maybe(..))
import Foreign.Object (lookup)

import State.Action (Actions, Dispatch, Props, actions, props)
import State.Entity (EntityId)
import State.Board (State)
import State.Board.Action (Action(..))
import State.Board.List (list)

type ListProps = Props
  { name :: String
  , itemIds :: Array EntityId
  }

type OwnProps =
  { id :: EntityId }

type ListActions = Actions
  { addItem :: String -> Unit }

mapStateToProps :: forall a. { board :: State | a } -> OwnProps -> ListProps
mapStateToProps { board } { id } =
  let
    maybeList = lookup id board.list.byId
  in
  case maybeList of
    Nothing -> props $ list ""
    Just l -> props $ l

mapDispatchToProps :: Dispatch -> OwnProps -> ListActions
mapDispatchToProps dispatch { id } = actions
  { addItem: \x -> dispatch $ Just $ AddItemToList id x }
