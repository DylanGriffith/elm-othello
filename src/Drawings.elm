module Drawings exposing (drawBlack, drawWhite, drawEmpty)

import Svg exposing (..)
import Svg.Attributes exposing (..)
import Html.Events exposing (onClick)

drawWhite =
  svg [width "100", height "100"] [
     rect [x "0", y "0", height "100", stroke "black", strokeWidth "5", width "100", fill "green"] []
     , circle [cx "50", cy "50", r "40", fill "white"] []
    ]

drawBlack =
  svg [width "100", height "100"] [
     rect [x "0", y "0", height "100", stroke "black", strokeWidth "5", width "100", fill "green"] []
     , circle [cx "50", cy "50", r "40", fill "black"] []
    ]

drawEmpty clickMessage =
  svg [width "100", height "100", onClick clickMessage] [
     rect [x "0", y "0", height "100", stroke "black", strokeWidth "5", width "100", fill "green"] []
    ]
