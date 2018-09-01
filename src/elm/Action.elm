module Action
    exposing
        ( goTo
        , navigate
        , recordInputUrl
        )

import Message exposing (Message(..))
import Model exposing (Model)
import OCaml
import Port


recordInputUrl : Model -> String -> ( Model, Cmd Message )
recordInputUrl model value =
    ( { model | urlState = value }, Cmd.none )


navigate : Message -> Model -> ( Model, Cmd Message )
navigate message model =
    ( model, Port.navigateHistory (OCaml.ofHistory message) )


goTo : Model -> ( Model, Cmd Message )
goTo model =
    ( model, Port.gotoUrl model.urlState )
