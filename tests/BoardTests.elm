module BoardTests exposing (all)

import Test exposing (..)
import Expect
import Board exposing (Cell(..))
import Board exposing (..)

all =
  describe "Board"
    [ describe "addPiece"
      [ test "adds the black piece first" <|
        \() ->
          Expect.equal (pieceAt 6 4 (setCell White 6 4 Board.emptyBoard )) White
      ]
    ]
