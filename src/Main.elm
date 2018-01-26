module Main exposing (..)

import Html exposing (Html, button, div, h1, i, img, text)
import Html.Attributes exposing (class, src)
import Json.Decode as Decode exposing (Value)
import Navigation exposing (Location)
import Route exposing (Route(..))


---- MODEL ----


type alias Model =
    {}


init : Value -> Location -> ( Model, Cmd Msg )
init val location =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = SetRoute (Maybe Route)



-- TODO: change this so it'll return the right combination of model and Cmd's in each case


setRoute : Maybe Route -> Model -> ( Model, Cmd Msg )
setRoute maybeRoute model =
    case maybeRoute of
        Nothing ->
            ( model, Cmd.none )

        Just Route.Home ->
            ( model, Cmd.none )

        Just Route.Authorize ->
            ( model, Cmd.none )


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


main : Program Value Model Msg
main =
    Navigation.programWithFlags (Route.fromLocation >> SetRoute)
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
