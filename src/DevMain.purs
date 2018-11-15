module DevMain where

import Prelude

import Effect (Effect)
import Nemo (nemoDev)
import Nemo.Types (DebugConfig)
import Nemo.Utils (defaultDebugConfig)
import Lib.Game (asset, initialState)

main :: Effect Unit
main = nemoDev initialState asset config

config :: DebugConfig
config = defaultDebugConfig
