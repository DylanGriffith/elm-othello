module Tests exposing (..)

import Test exposing (..)
import Expect
import String
import Board exposing (Cell(..))
import Board exposing (..)

all : Test
all =
    describe "Board"
      [ describe "addPiece"
        [ test "adds the black piece first" <|
          \() ->
             Expect.equal (pieceAt (addPiece Board.emptyBoard White 6 4) 6 4) White
        ]
      ]
