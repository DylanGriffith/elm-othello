import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import List exposing (map)
import Task
import Drawings exposing (..)

main =
  App.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

type Cell = Empty | Black | White

-- MODEL

type alias Model =
  {
    cells : List (List Cell)
  }

initialCells =
  [
      [Empty, Black, White, Empty, Empty, Black, White, Empty]
      , [Empty, Black, White, Empty, Empty, Black, White, Empty]
      , [Empty, Black, White, Empty, Empty, Black, White, Empty]
      , [Empty, Black, White, Empty, Empty, Black, White, Empty]
      , [Empty, Black, White, Empty, Empty, Black, White, Empty]
      , [Empty, Black, White, Empty, Empty, Black, White, Empty]
      , [Empty, Black, White, Empty, Empty, Black, White, Empty]
      , [Empty, Black, White, Empty, Empty, Black, White, Empty]
  ]


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
  div [(style [("font-size", "0")])] (map renderCellRow model.cells)

renderCellRow cellRow =
  div [] (map renderCell cellRow)

renderCell a =
  case a of
    Empty ->
      drawEmpty
    Black ->
      drawBlack
    White ->
      drawWhite

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

-- HTTP

