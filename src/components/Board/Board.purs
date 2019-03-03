module Board.Connect where

import Prelude (Unit, ($))
import State.Entity (EntityId)
import State.Board (State)
import State.Board.Action (Action(..))

type Props =
  { props ::
    { listIds :: Array EntityId }
  }

type Actions =
  { actions ::
    { addList :: String -> Unit }
  }

mapStateToProps :: forall a. State -> a -> Props
mapStateToProps x _ =
  { props:
    { listIds: x.list.ids }
  }

mapDispatchToProps :: forall a. (Action -> Unit) -> a -> Actions
mapDispatchToProps dispatch _ =
  { actions:
    { addList: \x -> dispatch $ AddList x }
  }
