module Route exposing (Route(..), onLinkClick, parseLocation)

import Html
import Html.Events exposing (onWithOptions)
import Json.Decode as Decode
import Navigation exposing (Location)
import UrlParser as Url exposing (Parser, oneOf, parsePath, s, top)


-- ROUTING --


type Route
    = Home
    | Authorize
    | NotFound


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ Url.map Home top
        , Url.map Home (s "home")
        , Url.map Authorize (s "authorize")
        ]



-- HELPER FUNCTIONS --


onLinkClick : msg -> Html.Attribute msg
onLinkClick message =
    let
        options =
            { stopPropagation = False
            , preventDefault = True
            }
    in
    onWithOptions "click" options (Decode.succeed message)


parseLocation : Location -> Route
parseLocation location =
    case parsePath matchers location of
        Just route ->
            route

        Nothing ->
            NotFound
