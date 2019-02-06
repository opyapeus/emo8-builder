module DevMain where

import Prelude

import Effect (Effect)
import Emo8 (emo8Dev)
import Emo8.Class.GameDev (loadStateWithDefault)
import Lib.Game (asset, initialState, localKey, monitorSize)

main :: Effect Unit
main = do
    s <- loadStateWithDefault initialState localKey
    emo8Dev s asset monitorSize
