module Lib.Game where

import Prelude

import Data.Generic.Rep (class Generic)
import Emo8.Action.Draw (cls, emo)
import Emo8.Class.Game (class Game)
import Emo8.Class.GameDev (class GameDev)
import Emo8.Data.Color (Color(..))
import Emo8.Data.Emoji as E
import Emo8.FFI.LocalStorage (LocalKey(..))
import Emo8.Types (Asset, MonitorSize, Position)
import Emo8.Utils (defaultMonitorSize, emptyAsset)
import Foreign.Class (class Decode, class Encode)
import Foreign.Generic (defaultOptions, genericDecode, genericEncode)

data State = State
  { frame :: Int
  , pos :: Position
  }

instance gameState :: Game State where
  update i (State s) = do
    let nx = case i.isLeft, i.isRight of
          true, false -> s.pos.x - moveSpeed
          false, true-> s.pos.x + moveSpeed
          _, _ -> s.pos.x
        ny = case i.isUp, i.isDown of
          true, false -> s.pos.y + moveSpeed
          false, true-> s.pos.y - moveSpeed
          _, _ -> s.pos.y
    pure $ State
      { frame: s.frame + 1
      , pos:
        { x: nx
        , y: ny
        }
      }

  draw (State s) = do
    cls Maroon
    emo E.hatchingChick 128 s.pos.x s.pos.y

  sound _ = pure unit

derive instance genericState :: Generic State _
instance decodeState :: Decode State where
  decode = genericDecode defaultOptions
instance encodeState :: Encode State where
  encode = genericEncode defaultOptions
instance gameDevState :: GameDev State where
  saveLocal (State s) = if mod s.frame 60 == 0 then [ localKey ] else []

initialState :: State
initialState = State
  { frame: 0
  , pos:
    { x: 192
    , y: 192
    }
  }

localKey :: LocalKey
localKey = LocalKey "per60frame"

moveSpeed :: Int
moveSpeed = 4

monitorSize :: MonitorSize
monitorSize = defaultMonitorSize

asset :: Asset
asset = emptyAsset
