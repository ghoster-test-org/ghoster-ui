module Page.Home exposing (..)

import Html exposing (Html, a, button, div, h1, i, text)
import Html.Attributes exposing (class, href)
import Msgs exposing (Msg(..))
import Route exposing (onLinkClick)


authorizePath : String
authorizePath =
    "/authorize"


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
