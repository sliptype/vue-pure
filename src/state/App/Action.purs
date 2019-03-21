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
