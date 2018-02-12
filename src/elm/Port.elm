port module Port exposing (..)


port send : Int -> Cmd msg


port receive : (Int -> msg) -> Sub msg
