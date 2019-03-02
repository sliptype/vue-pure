module Counter.Connect where

import Prelude (Unit, identity, ($))
import State.Counter.Action (Action(..))
import State.Counter.State (State)

type Props =
  { props ::
    { value :: State }
  }

type Actions =
  { actions ::
    { increment :: Int -> Unit
    , decrement :: Int -> Unit
    }
  }

mapStateToProps :: State -> Props
mapStateToProps x =
  { props:
    { value: x }
  }

mapDispatchToProps :: (Action -> Unit) -> Actions
mapDispatchToProps dispatch =
  { actions:
    { increment: \x -> dispatch $ Increment x
    , decrement: \x -> dispatch $ Decrement x
    }
  }
