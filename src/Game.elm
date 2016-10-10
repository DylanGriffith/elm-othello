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
  case isValidMove row col game of
    True ->
      actuallyMakeMove row col game
    False ->
      game

actuallyMakeMove : Int -> Int -> Game -> Game
actuallyMakeMove row col game =
  { game | board = (addPiece (pieceFor (nextTurn game)) row col game.board) }
    |> toggleTurn

boardPieceAt row col game =
  pieceAt row col game.board

isValidMove row col game =
  isFlanking 0 1 row col game
  || isFlanking 1 0 row col game
  || isFlanking 1 1 row col game
  || isFlanking 0 (-1) row col game
  || isFlanking (-1) 0 row col game
  || isFlanking (-1) (-1) row col game
  || isFlanking (-1) 1 row col game
  || isFlanking 1 (-1) row col game

isFlanking rowOff colOff row col game =
  let
    piece = pieceFor (nextTurn game)
    otherPiece = oppositePiece piece
  in
    case row + rowOff of
      0 ->
        False
      (-1) ->
        False
      7 ->
        False
      8 ->
        False
      _ ->
        case col + colOff of
          0 ->
            False
          (-1) ->
            False
          7 ->
            False
          8 ->
            False
          _ ->
            ((pieceAt (row + rowOff) (col + colOff) game.board) == otherPiece)
             && (((pieceAt (row + 2*rowOff) (col + 2*colOff) game.board) == piece)
                 || isFlanking rowOff colOff (row + rowOff) (col + colOff) game)

oppositePiece piece =
  case piece of
    Black ->
      White
    White ->
      Black
    Empty ->
      Empty

pieceFor player =
  case player of
    BlackPlayer ->
      Black
    WhitePlayer ->
      White
