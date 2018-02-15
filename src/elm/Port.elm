port module Port exposing (navigateHistory, gotoUrl)

import OCaml


port navigateHistory : OCaml.Value String -> Cmd msg


port gotoUrl : String -> Cmd msg
