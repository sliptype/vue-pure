module Board.Connect where

import Prelude (Unit, ($))
import Data.Maybe (Maybe(..))

import State.Action (Actions, Dispatch, Props, actions, props)
import State.Entity (EntityId)
import State.Board (State)
import State.Board.Action (Action(..))

type BoardProps = Props
  { listIds :: Array EntityId }

type BoardActions = Actions
  { addList :: String -> Unit }

mapStateToProps :: forall a b. { board :: State | a } -> b -> BoardProps
mapStateToProps { board } _ = props
  { listIds: board.list.ids }

mapDispatchToProps :: forall a. Dispatch -> a -> BoardActions
mapDispatchToProps dispatch _ = actions
  { addList: \x -> dispatch $ Just $ AddList x }
