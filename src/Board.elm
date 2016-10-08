module Board exposing (..)
import Array exposing (..)

type Cell = Empty | Black | White

type alias Board = Array (Array Cell)

pieceAt : Int -> Int -> Board -> Cell
pieceAt row col board  =
  case get row board of
    Just r ->
      case get col r of
        Just val ->
          val
        Nothing ->
          Empty
    Nothing ->
      Empty

addPiece : Cell -> Int -> Int -> Board -> Board
addPiece piece row col board =
  case get row board of
    Just r ->
      set row (set col piece r) board
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
