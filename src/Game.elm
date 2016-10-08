module Game exposing (..)
import Board exposing (..)

type alias Game =
  {
    currentTurn: Player,
    board : Board
  }

type Player = BlackPlayer | WhitePlayer

type alias Move = (Int, Int)

nextTurn game =
  game.currentTurn

toggleTurn game =
  case game.currentTurn of
    BlackPlayer ->
      { game | currentTurn = WhitePlayer }
    WhitePlayer ->
      { game | currentTurn = BlackPlayer }

newGame : Game
newGame =
  {
    currentTurn = BlackPlayer,
    board = initalBoard
  }

initalBoard =
  emptyBoard
    |> addPiece White 3 3
    |> addPiece White 4 4
    |> addPiece Black 3 4
    |> addPiece Black 4 3

board game =
  game.board

makeMove : Int -> Int -> Game -> Game
makeMove row col game =
  { game | board = (addPiece (pieceFor (nextTurn game)) row col game.board) }
    |> toggleTurn

boardPieceAt row col game =
  pieceAt row col game.board

pieceFor player =
  case player of
    BlackPlayer ->
      Black
    WhitePlayer ->
      White
