module Game exposing (..)
import Board exposing (..)

type alias Game =
  {
    currentTurn: Player,
    board : Board
  }

type Player = BlackPlayer | WhitePlayer

type alias CellPair = (Int, Int)

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
    |> setCell White 3 3
    |> setCell White 4 4
    |> setCell Black 3 4
    |> setCell Black 4 3

board game =
  game.board

makeMove : Int -> Int -> Game -> Game
makeMove row col game =
  case flippedPieces row col game of
    [] ->
      game
    flipped ->
      makeFlips flipped (actuallyMakeMove row col game)

makeFlips : List CellPair -> Game -> Game
makeFlips flipped game =
  List.foldr makeFlip game flipped

makeFlip : CellPair -> Game -> Game
makeFlip (row, col) game =
  {game | board = setCell (oppositePiece (pieceAt row col game.board)) row col game.board}

actuallyMakeMove : Int -> Int -> Game -> Game
actuallyMakeMove row col game =
  { game | board = (setCell (pieceFor (nextTurn game)) row col game.board) }
    |> toggleTurn

boardPieceAt row col game =
  pieceAt row col game.board

flippedPieces : Int -> Int -> Game -> List (Int, Int)
flippedPieces row col game =
  flanked 0 1 row col game
  ++ flanked 1 0 row col game
  ++ flanked 1 1 row col game
  ++ flanked 0 (-1) row col game
  ++ flanked (-1) 0 row col game
  ++ flanked (-1) (-1) row col game
  ++ flanked (-1) 1 row col game
  ++ flanked 1 (-1) row col game

isValidMove row col game =
  flippedPieces row col game /= []

flanked : Int -> Int -> Int -> Int -> Game -> List (Int, Int)
flanked rowOff colOff row col game =
  let
    piece = pieceFor (nextTurn game)
    otherPiece = oppositePiece piece
  in
    case row + rowOff of
      0 ->
        []
      (-1) ->
        []
      7 ->
        []
      8 ->
        []
      _ ->
        case col + colOff of
          0 ->
            []
          (-1) ->
            []
          7 ->
            []
          8 ->
            []
          _ ->
            case (pieceAt (row + rowOff) (col + colOff) game.board) == otherPiece of
              True ->
                case ((pieceAt (row + 2*rowOff) (col + 2*colOff) game.board) == piece) of
                  True ->
                    [(row + rowOff, col + colOff)]
                  False ->
                    case flanked rowOff colOff (row + rowOff) (col + colOff) game of
                      [] ->
                        []
                      flipped ->
                        [(row + rowOff, col + colOff)] ++ flipped
              False ->
                []

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
