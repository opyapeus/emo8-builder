module Main where

import Prelude

import Effect (Effect)
import Emo8 (emo8)
import Lib.Game (asset, initialState, monitorSize)

main :: Effect Unit
main = emo8 initialState asset monitorSize
