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

mapStateToProps :: State -> Props
mapStateToProps x =
  { props:
    { listIds: x.list.ids }
  }

mapDispatchToProps :: (Action -> Unit) -> Actions
mapDispatchToProps dispatch =
  { actions:
    { addList: \x -> dispatch $ AddList x }
  }
