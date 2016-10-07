module Tests exposing (..)

import Test exposing (..)
import Expect
import String
import Game exposing (Cell(..))
import Game exposing (..)

all : Test
all =
    describe "Game"
      [ describe "addPiece"
        [ test "adds the black piece first" <|
          \() ->
             Expect.equal (pieceAt (addPiece Game.emptyBoard 6 4) 6 4) Black
        ]
      ]
