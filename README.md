# purescript-wamp

[![Build Status](https://travis-ci.org/kkazuo/purescript-wamp.svg?branch=master)](https://travis-ci.org/kkazuo/purescript-wamp)

A bindings of [Autobahn|JS](http://autobahn.ws/js/).

## Installation

```
npm i autobahn
bower i purescript-wamp
```

## Usage

``` purescript
import Network.Wamp as Wamp

main = do
  conn <- Wamp.connection { realm: "realm1", url: "ws://example.com/ws" }
  conn # Wamp.onOpen \sess -> do
    sess # Wamp.pub1 "com.myapp.hello" "Hello, World!"
  conn # Wamp.open
```

You might setup example WAMP server with [Crossbar.io Docker Image](https://hub.docker.com/r/crossbario/crossbar/).

## Documentation

Module documentation is [published on Pursuit](https://pursuit.purescript.org/packages/purescript-wamp/).
