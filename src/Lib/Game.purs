module Lib.Game where

import Prelude

import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Nemo.Class.Game (class Game)
import Nemo.Data.Color (Color(..))
import Nemo.Data.Emoji as E
import Nemo.Draw.Action (cls, emo)
import Nemo.Types (Asset)
import Nemo.Utils (emptyAsset)

data State = Void

derive instance genericState :: Generic State _
instance showState :: Show State where
  show = genericShow

instance gameState :: Game State where
  update _ = pure

  draw _ = do
    cls Maroon
    emo E.hatchingChick 256 384 384

  sound _ = pure unit

initialState :: State
initialState = Void

asset :: Asset
asset = emptyAsset

