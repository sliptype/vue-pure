module Item.Connect where

import Prelude (Unit, ($))
import Data.Array
import Data.Maybe (Maybe(..))
import Foreign.Object (lookup)

import State.Action (Actions, Dispatch, Props, actions, bindActionCreator, props)
import State.Entity (EntityId)
import State.Board (State)
import State.Board.Action (Action(..))
import State.Board.Item (item)

type ItemProps = Props
  { name :: String }

type OwnProps =
  { id :: EntityId }

type ItemActions = Actions {}

mapStateToProps :: forall a. { board:: State | a } -> OwnProps -> ItemProps
mapStateToProps { board } { id } =
  let
    maybeItem = lookup id board.item.byId
  in
  case maybeItem of
    Nothing -> props $ item ""
    Just i -> props $ i

mapDispatchToProps :: ((Maybe Action) -> Unit) -> OwnProps -> ItemActions
mapDispatchToProps dispatch { id } = actions {}
