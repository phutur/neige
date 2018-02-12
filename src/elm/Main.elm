module Main exposing (..)

import Port
import Html
import Html.Events as Event


type alias Model =
    Int


type alias Flags =
    Maybe Int


type Message
    = Send Int
    | Receive Int


subscriptions : Model -> Sub Message
subscriptions _ =
    Sub.batch
        [ Port.receive Receive ]


update : Message -> Model -> ( Model, Cmd Message )
update message model =
    case message of
        Receive x ->
            ( x, Cmd.none )

        Send x ->
            ( model, Port.send x )


init : Flags -> ( Model, Cmd Message )
init flags =
    case flags of
        Nothing ->
            ( 0, Cmd.none )

        Just x ->
            ( x, Cmd.none )


view : Model -> Html.Html Message
view model =
    Html.div []
        [ Html.button
            [ Event.onClick (Send model) ]
            [ Html.text "send" ]
        , Html.text
            ("Hello World: " ++ toString model)
        ]


main : Platform.Program Flags Model Message
main =
    Html.programWithFlags
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
