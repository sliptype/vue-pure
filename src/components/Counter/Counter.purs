module Counter.Connect where

import Prelude (Unit, ($))
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

-- TODO: bindActionCreators
mapDispatchToProps :: forall a. ((Maybe Action) -> Unit) -> a -> Actions
mapDispatchToProps dispatch _ =
  { actions:
    { increment: \x -> dispatch $ Just $ Increment x
    , decrement: \x -> dispatch $ Just $ Decrement x
    }
  }
