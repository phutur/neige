open Js

class type t = object
  method app : App.t Js.t readonly_prop
  method _BrowserWindow :
    ((BrowserWindow.props Js.t -> BrowserWindow.t Js.t) constr) readonly_prop
end
