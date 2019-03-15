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

-- TODO: Should this be an effect?
dispatchAction :: ((Maybe Action) -> Unit) -> Action -> Unit
dispatchAction dispatch action = dispatch $ (Just action)

mapStateToProps :: forall a. State -> a -> Props
mapStateToProps x _ =
  { props:
    { value: x }
  }

mapDispatchToProps :: forall a. ((Maybe Action) -> Unit) -> a -> Actions
mapDispatchToProps dispatch _ =
  { actions:
    { increment: \x -> dispatchAction dispatch (Increment x)
    , decrement: \x -> dispatchAction dispatch (Decrement x)
    }
  }
