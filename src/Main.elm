module Main exposing (..)

import Html exposing (Html, button, div, h1, i, img, text)
import Html.Attributes exposing (class, src)


---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Ghoster, A better way to handle github permissions!" ]
        , button []
            [ i [ class "fab fa-github" ] []
            , text " Authorize with Github"
            ]
        ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
