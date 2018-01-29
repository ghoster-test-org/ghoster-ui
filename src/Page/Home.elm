module Page.Home exposing (..)

import Html exposing (Html, a, button, div, h1, i, text)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onWithOptions)
import Json.Decode as Decode
import Msgs exposing (Msg(..))


authorizePath : String
authorizePath =
    "/authorize"


onLinkClick : msg -> Html.Attribute msg
onLinkClick message =
    let
        options =
            { stopPropagation = False
            , preventDefault = True
            }
    in
    onWithOptions "click" options (Decode.succeed message)


view : Html Msg
view =
    div []
        [ h1 [] [ text "Ghoster, A better way to handle github permissions!" ]
        , a [ href authorizePath, onLinkClick (ChangeLocation authorizePath) ] [ text "authorize" ]
        , button []
            [ i [ class "fab fa-github" ] []
            , text " Authorize with Github"
            ]
        ]
