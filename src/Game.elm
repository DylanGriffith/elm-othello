module Game exposing (..)
import Array exposing (..)

type Cell = Empty | Black | White

type alias Board = Array (Array Cell)

pieceAt : Board -> Int -> Int -> Cell
pieceAt board row col =
  case get row board of
    Just r ->
      case get col r of
        Just val ->
          val
        Nothing ->
          Empty
    Nothing ->
      Empty

addPiece : Board -> Int -> Int -> Board
addPiece board row col =
  case get row board of
    Just r ->
      set row (set col Black r) board
    Nothing ->
      board

emptyBoard : Board
emptyBoard =
  fromList [
    emptyRow
    , emptyRow
    , emptyRow
    , emptyRow
    , emptyRow
    , emptyRow
    , emptyRow
    , emptyRow
  ]

emptyRow =
  fromList [Empty, Empty, Empty, Empty, Empty, Empty, Empty, Empty]
