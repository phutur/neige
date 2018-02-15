module Action
    exposing
        ( recordInputUrl
        , navigate
        , goTo
        )

import Port
import OCaml
import Message exposing (Message(..))
import Model exposing (Model)


recordInputUrl : Model -> String -> ( Model, Cmd Message )
recordInputUrl model value =
    ( { model | urlState = value }, Cmd.none )


navigate : Message -> Model -> ( Model, Cmd Message )
navigate message model =
    ( model, Port.navigateHistory (OCaml.ofHistory message) )


goTo : Model -> ( Model, Cmd Message )
goTo model =
    ( model, Port.gotoUrl ("goto:" ++ model.urlState) )
