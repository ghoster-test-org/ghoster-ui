module Route exposing (Route(..), fromLocation)

import Navigation exposing (Location)
import UrlParser as Url exposing ((</>), Parser, oneOf, parseHash, s)


-- ROUTING --


type Route
    = Home
    | Authorize


route : Parser (Route -> a) a
route =
    oneOf [ Url.map Home (s ""), Url.map Authorize (s "authorize") ]



-- HELPER FUNCTIONS --


fromLocation : Location -> Maybe Route
fromLocation location =
    if String.isEmpty location.hash then
        Just Home
    else
        parseHash route location
