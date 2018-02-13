module View exposing (global)

import Message exposing (Message(..))
import Model exposing (Flags, Model)
import Html.Attributes as Attr
import Html
    exposing
        ( Html
        , div
        , text
        , input
        )


global : Model -> Html Message
global model =
    div [] [ text "foo" ]
