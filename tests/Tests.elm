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
             Expect.equal (pieceAt 6 4 (addPiece White 6 4 Board.emptyBoard)) White
        ]
      ]
