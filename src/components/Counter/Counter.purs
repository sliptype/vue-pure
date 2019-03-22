module Counter.Connect where

import Prelude (Unit, ($))
import Record.Extra (mapRecord)

import State.Action (Actions, Dispatch, Props, actions, bindActionCreator, props)
import State.Counter (State)
import State.Counter.Action (Action(..))

type CounterProps = Props
  { value :: State }

type CounterActions = Actions
  { increment :: Int -> Unit
  , decrement :: Int -> Unit
  }

-- mapStateToProps is a function that takes 2 arguments and returns Props
-- The first agrument is a state that contains the counter state
-- The second argument is of any type and contains the components own props (unused here)
mapStateToProps :: forall a b. { counter :: State | a } -> b -> CounterProps
mapStateToProps { counter } _ = props
  { value: counter }

-- mapDispatchToProps is a function that takes 2 arguments and returns an Actions record
-- The first argument is a Dispatch function
-- The second argument is of any type and contains the components own props (unused here)
mapDispatchToProps :: forall a. Dispatch -> a -> CounterActions
mapDispatchToProps dispatch _ = actions $
  mapRecord (bindActionCreator dispatch)
    { increment: \x -> Increment x
    , decrement: \x -> Decrement x
    }
