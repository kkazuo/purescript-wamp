module Test.Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)

import Network.Wamp as W

main :: forall e. Eff (console :: CONSOLE, wamp :: W.WAMP | e) Unit
main = do
  log "You should add some tests."
  W.connection { realm: "realm1", url: "ws://127.0.0.1:8080/ws" }
  pure unit
