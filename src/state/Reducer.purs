module State.Reducer where

-- Reducer is a function that:
-- Takes:
--   an action of type b
--   a state of type a
-- Returns:
--   a state of type a
type Reducer a b = b -> a -> a
