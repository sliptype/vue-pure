module Counter.Connect where

import Prelude (Unit, (<<<))
import Record.Extra (mapRecord)
import Data.Maybe (Maybe(..))
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

type Dispatch = ((Maybe Action) -> Unit)

-- TODO: Bind higher arity action creators
bindActionCreator :: forall a. Dispatch -> (a -> Action) -> (a -> Unit)
bindActionCreator dispatch actionCreator = dispatch <<< Just <<< actionCreator

-- bindActionCreators :: forall a b. Dispatch -> { | a } -> { | b }
-- bindActionCreators dispatch actionCreators = mapRecord (bindActionCreator dispatch) actionCreators

mapDispatchToProps :: forall a. Dispatch -> a -> Actions
mapDispatchToProps dispatch _ =
  { actions: mapRecord (bindActionCreator dispatch)
    { increment: \x -> Increment x
    , decrement: \x -> Decrement x
    }
  }
