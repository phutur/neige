module Model exposing (Model, Flags, init)


type alias Flags =
    Maybe Int


type alias Model =
    { urlState : String }


init : Model
init =
    { urlState = ""
    }
