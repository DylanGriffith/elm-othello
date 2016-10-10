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
        isValidMoveTest1
        , isValidMoveTest2
        , isValidMoveTest3
        , isValidMoveTest4
        , isValidMoveTest5
        , isValidMoveTest6
        , isValidMoveTest7
        , isValidMoveTest8
        , isValidMoveTest9
        , isValidMoveTest10
        , isValidMoveTest11
        , isValidMoveTest12
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

isValidMoveTest5 =
  let
    board = newGame.board
     |> setCell Black 4 4
     |> setCell Black 4 2
     |> setCell Black 4 1
     |> setCell White 4 0
    game = { currentTurn = WhitePlayer, board = board }
  in
    test "isValidMove 5" <|
      \() ->
        Expect.equal (isValidMove 4 5 game) True

isValidMoveTest6 =
  let
    board = newGame.board
     |> setCell White 2 2
     |> setCell Black 1 1
    game = { currentTurn = BlackPlayer, board = board }
  in
    test "isValidMove 6" <|
      \() ->
        Expect.equal (isValidMove 5 5 game) True

isValidMoveTest7 =
  let
    board = newGame.board
     |> setCell Black 4 4
     |> setCell Black 4 2
     |> setCell Black 4 1
     |> setCell White 4 5
    game = { currentTurn = WhitePlayer, board = board }
  in
    test "isValidMove 7" <|
      \() ->
        Expect.equal (isValidMove 4 0 game) True

isValidMoveTest8 =
  let
    board = newGame.board
     |> setCell White 2 2
     |> setCell White 5 5
     |> setCell Black 6 6
    game = { currentTurn = BlackPlayer, board = board }
  in
    test "isValidMove 8: flank bottom right" <|
      \() ->
        Expect.equal (isValidMove 1 1 game) True

isValidMoveTest9 =
  let
    board = newGame.board
     |> setCell Black 5 2
     |> setCell Black 2 5
     |> setCell White 6 1
    game = { currentTurn = WhitePlayer, board = board }
  in
    test "isValidMove 9: flank bottom left" <|
      \() ->
        Expect.equal (isValidMove 1 6 game) True

isValidMoveTest10 =
  let
    board = newGame.board
     |> setCell Black 5 2
     |> setCell Black 2 5
     |> setCell White 1 6
    game = { currentTurn = WhitePlayer, board = board }
  in
    test "isValidMove 10: flank top right" <|
      \() ->
        Expect.equal (isValidMove 6 1 game) True

isValidMoveTest11 =
  let
    board = newGame.board
     |> setCell White 4 4
     |> setCell White 5 4
     |> setCell White 6 4
     |> setCell Black 3 4
    game = { currentTurn = BlackPlayer, board = board }
  in
    test "isValidMove 11: flank top" <|
      \() ->
        Expect.equal (isValidMove 7 4 game) True

isValidMoveTest12 =
  let
    board = newGame.board
     |> setCell Black 4 4
     |> setCell Black 5 4
     |> setCell Black 6 4
     |> setCell White 7 4
    game = { currentTurn = WhitePlayer, board = board }
  in
    test "isValidMove 12: flank bottom" <|
      \() ->
        Expect.equal (isValidMove 3 4 game) True
