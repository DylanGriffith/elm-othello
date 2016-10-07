module Drawings exposing (drawBlack, drawWhite, drawEmpty)

import Svg exposing (..)
import Svg.Attributes exposing (..)

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

drawEmpty =
  svg [width "100", height "100"] [
     rect [x "0", y "0", height "100", stroke "black", strokeWidth "5", width "100", fill "green"] []
    ]
