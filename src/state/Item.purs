module State.Item where

import Prelude

-- Defines a type "Item" that is a record (object)
-- containing a field "name" of type String
type Item = { name :: String }

-- Defines a function "item" of the type String -> Item
-- Meaning it takes 1 argument of string and returns an Item
item :: String -> Item
item name = { name }
