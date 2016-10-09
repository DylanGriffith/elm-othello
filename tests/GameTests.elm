module GameTests exposing (all)

import Test exposing (..)
import Expect
import Board exposing (Cell(..))
import Board exposing (..)
import Game exposing (..)

all =
  describe "Game"
    [ describe "newGame"
      [
        test "starts with black player's turn" <|
          \() ->
            Expect.equal (nextTurn newGame) BlackPlayer
        , test "starts with white in 3,3" <|
          \() ->
            Expect.equal (pieceAt 3 3 (board newGame)) White
        , test "starts with white in 4,4" <|
          \() ->
            Expect.equal (pieceAt 4 4 (board newGame)) White
        , test "starts with black in 3,4" <|
          \() ->
            Expect.equal (pieceAt 3 4 (board newGame)) Black
        , test "starts with black in 4,3" <|
          \() ->
            Expect.equal (pieceAt 4 3 (board newGame)) Black
      ]
    , describe "makeMove"
      [
        test "adds black piece" <|
          \() ->
            Expect.equal (boardPieceAt 4 5 (makeMove 4 5 newGame)) Black
        , test "switches turn to white player" <|
          \() ->
            Expect.equal (nextTurn (makeMove 4 5 newGame)) WhitePlayer
        , test "does not swap player with invalid move" <|
          \() ->
            Expect.equal (nextTurn (makeMove 2 4 newGame)) BlackPlayer
        , test "does not place piece with invalid move" <|
          \() ->
            Expect.equal (boardPieceAt 2 4 (makeMove 2 4 newGame)) Empty
      ]
    , describe "isValidMove"
      [
        isValidMoveTest2
      ]
    ]

isValidMoveTest1 =
  test "isValidMove 1" <|
    \() ->
      Expect.equal (isValidMove 4 5 newGame) True

isValidMoveTest2 =
  test "isValidMove 2" <|
    \() ->
      Expect.equal (isValidMove 2 4 newGame) False

isValidMoveTest3 =
  test "isValidMove 3" <|
    \() ->
      Expect.equal (isValidMove 4 2 newGame) False

isValidMoveTest4 =
  test "isValidMove 4" <|
    \() ->
      Expect.equal (isValidMove 5 3 newGame) False
