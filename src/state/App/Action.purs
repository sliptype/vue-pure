module State.Action where

import Prelude (Unit, (<<<))
import Data.Maybe (Maybe(..))
import Type.Row.Homogeneous (class Homogeneous)

type Dispatch = forall a. ((Maybe a) -> Unit)

-- TODO: Bind higher arity action creators
bindActionCreator :: forall a b. Dispatch -> (a -> b) -> (a -> Unit)
bindActionCreator dispatch actionCreator = dispatch <<< Just <<< actionCreator

-- TODO: Bind action creators
-- bindActionCreators :: forall a ra rb. Homogeneous ra (a -> Action) => Homogeneous rb (a -> Unit) => Dispatch -> { | ra } -> { | rb }
-- bindActionCreators dispatch actionCreators = mapRecord (bindActionCreator dispatch) actionCreators

-- Actions is a type synonym for a record containing a "actions" field of type a
type Actions a = { actions :: a }

-- Props is a type synonym for a record containing a "props" field of type a
type Props a = { props :: a }

actions :: forall a. { | a } -> Actions { | a }
actions a = { actions: a }

props :: forall a. { | a } -> Props { | a }
props a = { props: a }
