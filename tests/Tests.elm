module Tests exposing (..)
import Test exposing (..)
import BoardTests
import GameTests

all : Test
all =
  describe "Tests"
    [
      BoardTests.all,
      GameTests.all
    ]
