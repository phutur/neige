module View exposing (global)

import Message exposing (Message(..))
import Model exposing (Flags, Model)
import Html.Attributes as Attr
import Html.Events exposing (onInput, onClick)
import Html
    exposing
        ( Html
        , div
        , text
        , input
        , header
        , nav
        , button
        )


global : Model -> Html Message
global model =
    div
        []
        [ dragBar model
        , toolBar model
        ]


dragBar : Model -> Html Message
dragBar model =
    header
        [ Attr.class "title-bar" ]
        []


toolBar : Model -> Html Message
toolBar model =
    nav
        [ Attr.class "tool-bar" ]
        [ div []
            [ tools model
            , inputUrl model
            , goButton model
            ]
        ]


tools : Model -> Html Message
tools model =
    div
        []
        [ button [ onClick Pred ] [ text "◄" ]
        , button [ onClick Succ ] [ text "▶" ]
        ]


goButton : Model -> Html Message
goButton model =
    div []
        [ button [ onClick GoTo ] [ text "➡" ]
        ]


inputUrl : Model -> Html Message
inputUrl model =
    input
        [ Attr.class "url-bar"
        , Attr.placeholder "test"
        , Attr.value model.urlState
        , onInput RecordInputUrl
        ]
        []
