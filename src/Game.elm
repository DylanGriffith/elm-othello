module Game exposing (..)
import Board exposing (..)

type alias Game =
  {
    board : Board
  }

nextTurn game =
  Black

newGame =
  { board = initalBoard }

initalBoard =
  emptyBoard
    |> addPiece White 3 3
    |> addPiece White 4 4
    |> addPiece Black 3 4
    |> addPiece Black 4 3

board game =
  game.board
