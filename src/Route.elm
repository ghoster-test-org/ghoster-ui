module Route exposing (Route(..), parseLocation)

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


parseLocation : Location -> Route
parseLocation location =
    case parsePath matchers location of
        Just route ->
            Debug.log "route =" route

        Nothing ->
            NotFound
