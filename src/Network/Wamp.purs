-- |WAMP (Web Application Messaging Protocol)
-- |
-- |Bindings to (Autobahn|JS)[http://autobahn.ws/js/]
-- |
-- |``` purescript
-- |import Network.Wamp as Wamp
-- |
-- |main = do
-- |  conn <- Wamp.connection { realm: "realm1", url: "ws://example.com/ws" }
-- |  conn # Wamp.onOpen \sess -> do
-- |    sess # Wamp.pub1 "com.myapp.hello" "Hello, World!"
-- |  conn # Wamp.open
-- |```
module Network.Wamp
  ( WAMP
  , Connection
  , ConnectionOptions(..)
  , Session
  , Subscription
  , SessionId
  , connection
  , open
  , onOpen
  , close
  , sessionId
  , unSessionId
  , realm
  , log
  , setPrefix
  , clearPrefix
  , pub0, pub1, pub2, pub3, pub4, pub5, pub6, pub7, pub8, pub9
  , sub0, sub1, sub2, sub3, sub4, sub5, sub6, sub7, sub8, sub9
  , unsubscribe
  , call0, call1, call2, call3, call4, call5, call6, call7, call8, call9
  ) where

import Prelude (Unit, unit, (<>))
import Control.Monad.Aff (Aff)
import Control.Monad.Eff (Eff)
import Control.Promise (Promise, toAff)
import Data.Maybe (Maybe, isJust, fromMaybe)
import Data.Show (class Show, show)

foreign import data Connection :: *
foreign import data Session :: *
foreign import data Subscription :: *
foreign import data WAMP :: !

-- |WAMP connection options.
type ConnectionOptions =
  { realm :: String
  , url :: String
  }

newtype SessionId = SessionId Int

instance showSessionId :: Show SessionId where
  show (SessionId i) = "SessionId " <> show i

unSessionId :: SessionId -> Int
unSessionId (SessionId i) = i

-- |Create new WAMP connection end point.
foreign import connection
  :: forall e.
     ConnectionOptions
  -> Eff (wamp :: WAMP | e) Connection

foreign import onOpen
  :: forall e.
     (Session -> Eff (wamp :: WAMP | e) Unit)
  -> Connection
  -> Eff (wamp :: WAMP | e) Unit

-- |Open WAMP connection.
foreign import open :: forall e. Connection -> Eff (wamp :: WAMP | e) Unit

-- |Close WAMP connection.
close :: forall e. Maybe String -> Maybe String -> Connection -> Eff (wamp :: WAMP | e) Unit
close reason message conn =
  closeImpl isJust (fromMaybe unit) reason message conn

foreign import closeImpl :: forall a e. (Maybe a -> Boolean) -> (Maybe a -> a) -> Maybe String -> Maybe String -> Connection -> Eff (wamp :: WAMP | e) Unit

foreign import sessionId :: Session -> SessionId
foreign import realm :: Session -> String

-- |Print session log message.
foreign import log :: forall e. String -> Session -> Eff (wamp :: WAMP | e) Unit

foreign import setPrefix :: forall e. String -> String -> Session -> Eff (wamp :: WAMP | e) Unit
foreign import clearPrefix :: forall e. String -> Session -> Eff (wamp :: WAMP | e) Unit

-- |Publish topic without args.
foreign import pub0
  :: forall e.
     String
  -> Session
  -> Eff (wamp :: WAMP | e) Unit

-- |Publish topic with 1 arg.
foreign import pub1
  :: forall e a1.
     String
  -> a1
  -> Session
  -> Eff (wamp :: WAMP | e) Unit

-- |Publish topic with 2 args.
foreign import pub2
  :: forall e a1 a2.
     String
  -> a1 -> a2
  -> Session
  -> Eff (wamp :: WAMP | e) Unit

foreign import pub3
  :: forall e a1 a2 a3.
     String
  -> a1 -> a2 -> a3
  -> Session
  -> Eff (wamp :: WAMP | e) Unit

foreign import pub4
  :: forall e a1 a2 a3 a4.
     String
  -> a1 -> a2 -> a3 -> a4
  -> Session
  -> Eff (wamp :: WAMP | e) Unit

foreign import pub5
  :: forall e a1 a2 a3 a4 a5.
     String
  -> a1 -> a2 -> a3 -> a4 -> a5
  -> Session
  -> Eff (wamp :: WAMP | e) Unit

foreign import pub6
  :: forall e a1 a2 a3 a4 a5 a6.
     String
  -> a1 -> a2 -> a3 -> a4 -> a5 -> a6
  -> Session
  -> Eff (wamp :: WAMP | e) Unit

foreign import pub7
  :: forall e a1 a2 a3 a4 a5 a6 a7.
     String
  -> a1 -> a2 -> a3 -> a4 -> a5 -> a6 -> a7
  -> Session
  -> Eff (wamp :: WAMP | e) Unit

foreign import pub8
  :: forall e a1 a2 a3 a4 a5 a6 a7 a8.
     String
  -> a1 -> a2 -> a3 -> a4 -> a5 -> a6 -> a7 -> a8
  -> Session
  -> Eff (wamp :: WAMP | e) Unit

foreign import pub9
  :: forall e a1 a2 a3 a4 a5 a6 a7 a8 a9.
     String
  -> a1 -> a2 -> a3 -> a4 -> a5 -> a6 -> a7 -> a8 -> a9
  -> Session
  -> Eff (wamp :: WAMP | e) Unit

foreign import psub0
  :: forall eff r e. (Promise r -> Aff eff r)
  -> String
  -> (Eff eff Unit)
  -> Session -> Aff (wamp :: WAMP | e) Subscription
foreign import psub1
  :: forall eff r e a1. (Promise r -> Aff eff r)
  -> String
  -> (a1 -> Eff eff Unit)
  -> Session -> Aff (wamp :: WAMP | e) Subscription
foreign import psub2
  :: forall eff r e a1 a2. (Promise r -> Aff eff r)
  -> String
  -> (a1 -> a2 -> Eff eff Unit)
  -> Session -> Aff (wamp :: WAMP | e) Subscription
foreign import psub3
  :: forall eff r e a1 a2 a3. (Promise r -> Aff eff r)
  -> String
  -> (a1 -> a2 -> a3 -> Eff eff Unit)
  -> Session -> Aff (wamp :: WAMP | e) Subscription
foreign import psub4
  :: forall eff r e a1 a2 a3 a4. (Promise r -> Aff eff r)
  -> String
  -> (a1 -> a2 -> a3 -> a4 -> Eff eff Unit)
  -> Session -> Aff (wamp :: WAMP | e) Subscription
foreign import psub5
  :: forall eff r e a1 a2 a3 a4 a5. (Promise r -> Aff eff r)
  -> String
  -> (a1 -> a2 -> a3 -> a4 -> a5 -> Eff eff Unit)
  -> Session -> Aff (wamp :: WAMP | e) Subscription
foreign import psub6
  :: forall eff r e a1 a2 a3 a4 a5 a6. (Promise r -> Aff eff r)
  -> String
  -> (a1 -> a2 -> a3 -> a4 -> a5 -> a6 -> Eff eff Unit)
  -> Session -> Aff (wamp :: WAMP | e) Subscription
foreign import psub7
  :: forall eff r e a1 a2 a3 a4 a5 a6 a7. (Promise r -> Aff eff r)
  -> String
  -> (a1 -> a2 -> a3 -> a4 -> a5 -> a6 -> a7 -> Eff eff Unit)
  -> Session -> Aff (wamp :: WAMP | e) Subscription
foreign import psub8
  :: forall eff r e a1 a2 a3 a4 a5 a6 a7 a8. (Promise r -> Aff eff r)
  -> String
  -> (a1 -> a2 -> a3 -> a4 -> a5 -> a6 -> a7 -> a8 -> Eff eff Unit)
  -> Session -> Aff (wamp :: WAMP | e) Subscription
foreign import psub9
  :: forall eff r e a1 a2 a3 a4 a5 a6 a7 a8 a9. (Promise r -> Aff eff r)
  -> String
  -> (a1 -> a2 -> a3 -> a4 -> a5 -> a6 -> a7 -> a8 -> a9 -> Eff eff Unit)
  -> Session -> Aff (wamp :: WAMP | e) Subscription

sub0 :: forall eff e. String
     -> (Eff eff Unit)
     -> Session -> Aff (wamp :: WAMP | e) Subscription
sub0 = psub0 toAff

sub1 :: forall eff e a1. String
     -> (a1 -> Eff eff Unit)
     -> Session -> Aff (wamp :: WAMP | e) Subscription
sub1 = psub1 toAff

sub2 :: forall eff e a1 a2. String
     -> (a1 -> a2 -> Eff eff Unit)
     -> Session -> Aff (wamp :: WAMP | e) Subscription
sub2 = psub2 toAff

sub3 :: forall eff e a1 a2 a3. String
     -> (a1 -> a2 -> a3 -> Eff eff Unit)
     -> Session -> Aff (wamp :: WAMP | e) Subscription
sub3 = psub3 toAff

sub4 :: forall eff e a1 a2 a3 a4. String
     -> (a1 -> a2 -> a3 -> a4 -> Eff eff Unit)
     -> Session -> Aff (wamp :: WAMP | e) Subscription
sub4 = psub4 toAff

sub5 :: forall eff e a1 a2 a3 a4 a5. String
     -> (a1 -> a2 -> a3 -> a4 -> a5 -> Eff eff Unit)
     -> Session -> Aff (wamp :: WAMP | e) Subscription
sub5 = psub5 toAff

sub6 :: forall eff e a1 a2 a3 a4 a5 a6. String
     -> (a1 -> a2 -> a3 -> a4 -> a5 -> a6 -> Eff eff Unit)
     -> Session -> Aff (wamp :: WAMP | e) Subscription
sub6 = psub6 toAff

sub7 :: forall eff e a1 a2 a3 a4 a5 a6 a7. String
     -> (a1 -> a2 -> a3 -> a4 -> a5 -> a6 -> a7 -> Eff eff Unit)
     -> Session -> Aff (wamp :: WAMP | e) Subscription
sub7 = psub7 toAff

sub8 :: forall eff e a1 a2 a3 a4 a5 a6 a7 a8. String
     -> (a1 -> a2 -> a3 -> a4 -> a5 -> a6 -> a7 -> a8 -> Eff eff Unit)
     -> Session -> Aff (wamp :: WAMP | e) Subscription
sub8 = psub8 toAff

sub9 :: forall eff e a1 a2 a3 a4 a5 a6 a7 a8 a9. String
     -> (a1 -> a2 -> a3 -> a4 -> a5 -> a6 -> a7 -> a8 -> a9 -> Eff eff Unit)
     -> Session -> Aff (wamp :: WAMP | e) Subscription
sub9 = psub9 toAff

foreign import unsubscribeImpl
  :: forall eff e r.
     (Promise r -> Aff eff r)
  -> Subscription
  -> Session
  -> Aff (wamp :: WAMP | e) Boolean

unsubscribe
  :: forall e.
     Subscription
  -> Session
  -> Aff (wamp :: WAMP | e) Boolean
unsubscribe = unsubscribeImpl toAff

foreign import pcall0
  :: forall eff e r.
     (Promise r -> Aff eff r)
  -> String
  -> Session
  -> Aff (wamp :: WAMP | e) r

foreign import pcall1
  :: forall eff e r a1.
     (Promise r -> Aff eff r)
  -> String
  -> a1
  -> Session
  -> Aff (wamp :: WAMP | e) r

foreign import pcall2
  :: forall eff e r a1 a2.
     (Promise r -> Aff eff r)
  -> String
  -> a1 -> a2
  -> Session
  -> Aff (wamp :: WAMP | e) r

foreign import pcall3
  :: forall eff e r a1 a2 a3.
     (Promise r -> Aff eff r)
  -> String
  -> a1 -> a2 -> a3
  -> Session
  -> Aff (wamp :: WAMP | e) r

foreign import pcall4
  :: forall eff e r a1 a2 a3 a4.
     (Promise r -> Aff eff r)
  -> String
  -> a1 -> a2 -> a3 -> a4
  -> Session
  -> Aff (wamp :: WAMP | e) r

foreign import pcall5
  :: forall eff e r a1 a2 a3 a4 a5.
     (Promise r -> Aff eff r)
  -> String
  -> a1 -> a2 -> a3 -> a4 -> a5
  -> Session
  -> Aff (wamp :: WAMP | e) r

foreign import pcall6
  :: forall eff e r a1 a2 a3 a4 a5 a6.
     (Promise r -> Aff eff r)
  -> String
  -> a1 -> a2 -> a3 -> a4 -> a5 -> a6
  -> Session
  -> Aff (wamp :: WAMP | e) r

foreign import pcall7
  :: forall eff e r a1 a2 a3 a4 a5 a6 a7.
     (Promise r -> Aff eff r)
  -> String
  -> a1 -> a2 -> a3 -> a4 -> a5 -> a6 -> a7
  -> Session
  -> Aff (wamp :: WAMP | e) r

foreign import pcall8
  :: forall eff e r a1 a2 a3 a4 a5 a6 a7 a8.
     (Promise r -> Aff eff r)
  -> String
  -> a1 -> a2 -> a3 -> a4 -> a5 -> a6 -> a7 -> a8
  -> Session
  -> Aff (wamp :: WAMP | e) r

foreign import pcall9
  :: forall eff e r a1 a2 a3 a4 a5 a6 a7 a8 a9.
     (Promise r -> Aff eff r)
  -> String
  -> a1 -> a2 -> a3 -> a4 -> a5 -> a6 -> a7 -> a8 -> a9
  -> Session
  -> Aff (wamp :: WAMP | e) r

-- |Call RPC without args.
call0
  :: forall e r.
     String
  -> Session
  -> Aff (wamp :: WAMP | e) r
call0 = pcall0 toAff

-- |Call RPC with 1 arg.
call1
  :: forall e r a1.
     String
  -> a1
  -> Session
  -> Aff (wamp :: WAMP | e) r
call1 = pcall1 toAff

-- |Call RPC with 2 args.
call2
  :: forall e r a1 a2.
     String
  -> a1 -> a2
  -> Session
  -> Aff (wamp :: WAMP | e) r
call2 = pcall2 toAff

-- |Call RPC with 3 args.
call3
  :: forall e r a1 a2 a3.
     String
  -> a1 -> a2 -> a3
  -> Session
  -> Aff (wamp :: WAMP | e) r
call3 = pcall3 toAff

call4
  :: forall e r a1 a2 a3 a4.
     String
  -> a1 -> a2 -> a3 -> a4
  -> Session
  -> Aff (wamp :: WAMP | e) r
call4 = pcall4 toAff

call5
  :: forall e r a1 a2 a3 a4 a5.
     String
  -> a1 -> a2 -> a3 -> a4 -> a5
  -> Session
  -> Aff (wamp :: WAMP | e) r
call5 = pcall5 toAff

call6
  :: forall e r a1 a2 a3 a4 a5 a6.
     String
  -> a1 -> a2 -> a3 -> a4 -> a5 -> a6
  -> Session
  -> Aff (wamp :: WAMP | e) r
call6 = pcall6 toAff

call7
  :: forall e r a1 a2 a3 a4 a5 a6 a7.
     String
  -> a1 -> a2 -> a3 -> a4 -> a5 -> a6 -> a7
  -> Session
  -> Aff (wamp :: WAMP | e) r
call7 = pcall7 toAff

call8
  :: forall e r a1 a2 a3 a4 a5 a6 a7 a8.
     String
  -> a1 -> a2 -> a3 -> a4 -> a5 -> a6 -> a7 -> a8
  -> Session
  -> Aff (wamp :: WAMP | e) r
call8 = pcall8 toAff

call9
  :: forall e r a1 a2 a3 a4 a5 a6 a7 a8 a9.
     String
  -> a1 -> a2 -> a3 -> a4 -> a5 -> a6 -> a7 -> a8 -> a9
  -> Session
  -> Aff (wamp :: WAMP | e) r
call9 = pcall9 toAff
