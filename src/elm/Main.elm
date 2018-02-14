module Main exposing (main)

import Message exposing (Message(..))
import Model exposing (Flags, Model)
import Action
import View
import Html


subscriptions : Model -> Sub Message
subscriptions _ =
    Sub.batch
        []


update : Message -> Model -> ( Model, Cmd Message )
update message model =
    case message of
        RecordInputUrl value ->
            Action.recordInputUrl model value

        Pred ->
            Action.navigate message model

        Succ ->
            Action.navigate message model

        GoTo ->
            Action.goTo model


init : Flags -> ( Model, Cmd Message )
init flags =
    ( Model.init, Cmd.none )


main : Platform.Program Flags Model Message
main =
    Html.programWithFlags
        { init = init
        , update = update
        , view = View.global
        , subscriptions = subscriptions
        }
