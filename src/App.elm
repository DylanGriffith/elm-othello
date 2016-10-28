import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Array as A
import Task
import Drawings exposing (..)
import Game exposing (..)
import Board exposing (Cell(..))
import Board exposing (..)

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL

type alias Model =
  {
    game : Game.Game
  }

init : (Model, Cmd Msg)
init =
  ({game = newGame}, Cmd.none )

-- UPDATE

type Msg = AddPiece Int Int

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    AddPiece row col ->
      ({model | game = (makeMove row col model.game)}, Cmd.none)

-- VIEW

view : Model -> Html Msg
view model =
  div [(style [("font-size", "0")])] (A.toList (A.indexedMap renderCellRow model.game.board))

renderCellRow row cells =
  div [] (A.toList (A.indexedMap (renderCell row) cells))

renderCell row col cell =
  case cell of
    Empty ->
      drawEmpty (AddPiece row col)
    Black ->
      drawBlack
    White ->
      drawWhite

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

-- HTTP

