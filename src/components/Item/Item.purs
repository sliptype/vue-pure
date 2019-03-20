module Item.Connect where

import Prelude (Unit, ($))
import Data.Array
import Data.Maybe (Maybe(..))
import Foreign.Object (lookup)

import State.Entity (EntityId)
import State.Board (State)
import State.Board.Action (Action(..))
import State.Board.Item (item)

type Props =
  { props ::
    { name :: String }
  }

type OwnProps =
  { id :: EntityId }

type Actions =
  { actions :: {}
  }

mapStateToProps :: forall a. { board:: State | a }-> OwnProps -> Props
mapStateToProps { board } { id } =
  let
    maybeItem = lookup id board.item.byId
  in
  case maybeItem of
    Nothing -> { props: item "" }
    Just i -> { props: i }

mapDispatchToProps :: ((Maybe Action) -> Unit) -> OwnProps -> Actions
mapDispatchToProps dispatch { id } =
  { actions: {}
  }
