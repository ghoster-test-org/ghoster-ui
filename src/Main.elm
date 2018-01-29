module Main exposing (..)

import Html exposing (Html, button, div, h1, i, img, text)
import Msgs exposing (Msg(..))
import Navigation exposing (Location)
import Page.Authorize exposing (..)
import Page.Home exposing (..)
import Route exposing (Route(..), parseLocation)


---- MODEL ----


type alias Model =
    { route : Route }


initialModel : Route -> Model
initialModel route =
    { route = route }


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Route.parseLocation location
    in
    ( { route = currentRoute }, Cmd.none )



---- UPDATE ----


setRoute : Route -> Model -> ( Model, Cmd Msg )
setRoute route model =
    case route of
        Route.Home ->
            ( model, Cmd.none )

        Route.Authorize ->
            ( model, Cmd.none )

        Route.NotFound ->
            ( model, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
            ( { model | route = newRoute }, Cmd.none )

        ChangeLocation path ->
            ( model, Navigation.newUrl path )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        Route.Home ->
            Page.Home.view

        Route.Authorize ->
            Page.Authorize.view

        Route.NotFound ->
            div []
                [ text "route not found" ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Navigation.program OnLocationChange
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
