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
  isFlankingToLeft row col game
  || isFlankingToRight row col game
  || isFlankingToBottom row col game
  || isFlankingToTop row col game
  || isFlankingToTopLeft row col game
  || isFlankingToBottomRight row col game
  || isFlankingToBottomLeft row col game
  || isFlankingToTopRight row col game

isFlankingToLeft row col game =
  let
    piece = pieceFor (nextTurn game)
    otherPiece = oppositePiece piece
  in
    case row of
      0 ->
        False
      1 ->
        False
      _ ->
        ((pieceAt row (col - 1) game.board) == otherPiece)
         && (((pieceAt row (col - 2) game.board) == piece)
              || isFlankingToLeft row (col - 1) game)

isFlankingToRight row col game =
  let
    piece = pieceFor (nextTurn game)
    otherPiece = oppositePiece piece
  in
    case row of
      6 ->
        False
      7 ->
        False
      _ ->
        ((pieceAt row (col + 1) game.board) == otherPiece)
         && (((pieceAt row (col + 2) game.board) == piece)
             || isFlankingToRight row (col + 1) game)

isFlankingToTopLeft row col game =
  let
    piece = pieceFor (nextTurn game)
    otherPiece = oppositePiece piece
  in
    case row of
      0 ->
        False
      1 ->
        False
      _ ->
        case col of
          0 ->
            False
          1 ->
            False
          _ ->
            ((pieceAt (row - 1) (col - 1) game.board) == otherPiece)
             && (((pieceAt (row - 2) (col - 2) game.board) == piece)
                 || isFlankingToTopLeft (row - 1) (col - 1) game)

isFlankingToBottomRight row col game =
  let
    piece = pieceFor (nextTurn game)
    otherPiece = oppositePiece piece
  in
    case row of
      6 ->
        False
      7 ->
        False
      _ ->
        case col of
          6 ->
            False
          7 ->
            False
          _ ->
            ((pieceAt (row + 1) (col + 1) game.board) == otherPiece)
             && (((pieceAt (row + 2) (col + 2) game.board) == piece)
                 || isFlankingToBottomRight (row + 1) (col + 1) game)

isFlankingToBottomLeft row col game =
  let
    piece = pieceFor (nextTurn game)
    otherPiece = oppositePiece piece
  in
    case row of
      6 ->
        False
      7 ->
        False
      _ ->
        case col of
          0 ->
            False
          1 ->
            False
          _ ->
            ((pieceAt (row + 1) (col - 1) game.board) == otherPiece)
             && (((pieceAt (row + 2) (col - 2) game.board) == piece)
                 || isFlankingToBottomLeft (row + 1) (col - 1) game)

isFlankingToTopRight row col game =
  let
    piece = pieceFor (nextTurn game)
    otherPiece = oppositePiece piece
  in
    case row of
      0 ->
        False
      1 ->
        False
      _ ->
        case col of
          6 ->
            False
          7 ->
            False
          _ ->
            ((pieceAt (row - 1) (col + 1) game.board) == otherPiece)
             && (((pieceAt (row - 2) (col + 2) game.board) == piece)
                 || isFlankingToTopRight (row - 1) (col + 1) game)

isFlankingToBottom row col game =
  let
    piece = pieceFor (nextTurn game)
    otherPiece = oppositePiece piece
  in
    case row of
      6 ->
        False
      7 ->
        False
      _ ->
        ((pieceAt (row + 1) col game.board) == otherPiece)
         && (((pieceAt (row + 2) col game.board) == piece)
             || isFlankingToBottom (row + 1) col game)

isFlankingToTop row col game =
  let
    piece = pieceFor (nextTurn game)
    otherPiece = oppositePiece piece
  in
    case row of
      0 ->
        False
      1 ->
        False
      _ ->
        ((pieceAt (row - 1) col game.board) == otherPiece)
         && (((pieceAt (row - 2) col game.board) == piece)
             || isFlankingToTop (row - 1) col game)

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
