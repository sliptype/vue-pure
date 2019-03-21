module Counter.Connect where

import Prelude (Unit)
import Record.Extra (mapRecord)

import State.Action (Dispatch, bindActionCreator)
import State.Counter (State)
import State.Counter.Action (Action(..))

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

mapStateToProps :: forall a b. { counter :: State | a } -> b -> Props
mapStateToProps { counter } _ =
  { props:
    { value: counter }
  }

mapDispatchToProps :: forall a. Dispatch -> a -> Actions
mapDispatchToProps dispatch _ =
  { actions: mapRecord (bindActionCreator dispatch)
    { increment: \x -> Increment x
    , decrement: \x -> Decrement x
    }
  }
