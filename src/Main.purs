module Main where

import Prelude

import Effect (Effect)
import Nemo (nemo)
import Lib.Game (asset, initialState)

main :: Effect Unit
main = nemo initialState asset
