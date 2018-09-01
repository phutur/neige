module View exposing (global)

import Html
    exposing
        ( Html
        , a
        , button
        , div
        , form
        , header
        , input
        , text
        )
import Html.Attributes as Attr
import Html.Events exposing (onClick, onInput, onSubmit)
import Message exposing (Message(..))
import Model exposing (Flags, Model)


global : Model -> Html Message
global model =
    div
        []
        [ dragBar model
        , toolBar model
        , outputBar model
        ]


dragBar : Model -> Html Message
dragBar model =
    header
        [ Attr.class "title-bar" ]
        []


toolBar : Model -> Html Message
toolBar model =
    form
        [ Attr.class "tool-bar", onSubmit GoTo ]
        [ div []
            [ tools model
            , inputUrl model
            , goButton model
            ]
        ]


tools : Model -> Html Message
tools model =
    div
        [ Attr.class "history-btn" ]
        [ a [ onClick Pred ] [ text "◄" ]
        , a [ onClick Succ ] [ text "▶" ]
        ]


goButton : Model -> Html Message
goButton model =
    div [ Attr.class "validate-button" ]
        [ button [] [ text "➡" ]
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


outputBar : Model -> Html Message
outputBar model =
    div [ Attr.class "output-bar" ] []
