module List.Connect where

import Prelude (Unit, ($))
import Data.Array
import Data.Maybe (Maybe(..))
import Foreign.Object (lookup)

import State.Entity (EntityId)
import State.Board (State)
import State.Board.Action (Action(..))
import State.Board.List (list)

type Props =
  { props ::
    { name :: String
    , itemIds :: Array EntityId
    }
  }

type OwnProps =
  { id :: EntityId }

type Actions =
  { actions ::
    { addItem :: String -> Unit }
  }

mapStateToProps :: forall a. { board :: State | a } -> OwnProps -> Props
mapStateToProps { board } { id } =
  let
    maybeList = lookup id board.list.byId
  in
  case maybeList of
    Nothing -> { props: list "" }
    Just l -> { props: l }

mapDispatchToProps :: (Action -> Unit) -> OwnProps -> Actions
mapDispatchToProps dispatch { id } =
  { actions:
    { addItem: \x -> dispatch $ AddItemToList id x }
  }
