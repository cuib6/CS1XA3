module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

main =
      Browser.sandbox { init = init, update = update, view = view }

type alias Model =
      { alpha : String, beta : String }

init : Model
init = 
       Model "" ""

type Msg
        = Alpha String
        | Beta String

update : Msg -> Model -> Model
update msg model = 
        case msg of 
                Alpha alpha ->
                        { model | alpha = alpha }
                Beta beta ->
                        { model | beta = beta }
view : Model -> Html Msg
view model = 
        div [] 
                [ input [ type_ "text", value model.alpha, onInput Alpha ]  
                [], input [ type_ "text", value model.beta, onInput Beta ] 
                [], div [] [ text (model.alpha), text ":", text (model.beta) ] ]
