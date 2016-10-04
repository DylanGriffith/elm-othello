import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Task

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
  }
init : (Model, Cmd Msg)
init =
  (Model, Cmd.none )

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
  div []
    [
      row
      , row
      , row
      , row
      , row
      , row
      , row
      , row
      , row
    ]

row =
  div [(style [("float", "left")])] [
    square
    , square
    , square
    , square
    , square
    , square
    , square
    , square
  ]

square =
 div [(style [ ("backgroundColor", "green"), ("height", "100px"), ("width", "100px")])] []

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

-- HTTP

