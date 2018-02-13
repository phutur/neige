module Main exposing (main)

import Message exposing (Message(..))
import Model exposing (Flags, Model)
import View
import Html


subscriptions : Model -> Sub Message
subscriptions _ =
    Sub.batch
        []


update : Message -> Model -> ( Model, Cmd Message )
update message model =
    ( model, Cmd.none )


init : Flags -> ( Model, Cmd Message )
init flags =
    ( 0, Cmd.none )


main : Platform.Program Flags Model Message
main =
    Html.programWithFlags
        { init = init
        , update = update
        , view = View.global
        , subscriptions = subscriptions
        }
