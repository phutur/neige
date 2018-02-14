module OCaml exposing (Value, ofHistory)

import Message exposing (Message(..))


type alias Value a =
    { error : Bool
    , value : a
    }


ofHistory : Message -> Value String
ofHistory message =
    case message of
        Pred ->
            { error = False, value = "pred" }

        Succ ->
            { error = False, value = "succ" }

        _ ->
            { error = True, value = "" }
