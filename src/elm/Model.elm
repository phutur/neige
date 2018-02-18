module Model exposing (Model, Flags, init)


type alias Flags =
    Maybe String


type alias Model =
    { urlState : String }


init : Flags -> Model
init flag =
    { urlState = Maybe.withDefault "" flag
    }
