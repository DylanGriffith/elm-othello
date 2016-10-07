import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Array as A
import Task
import Drawings exposing (..)
import Game

main =
  App.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL

type alias Model =
  {
    cells : Game.Board
  }

initialCells =
  Game.emptyBoard

init : (Model, Cmd Msg)
init =
  ({cells = initialCells}, Cmd.none )

-- UPDATE

type Msg = NoMessageYet

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    NoMessageYet ->
      (model, Cmd.none)

-- VIEW

view : Model -> Html Msg
view model =
  div [(style [("font-size", "0")])] (A.toList (A.map renderCellRow model.cells))

renderCellRow cellRow =
  div [] (A.toList (A.map renderCell cellRow))

renderCell a =
  case a of
    Game.Empty ->
      drawEmpty
    Game.Black ->
      drawBlack
    Game.White ->
      drawWhite

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

-- HTTP

