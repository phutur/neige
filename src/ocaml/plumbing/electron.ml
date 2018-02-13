(** Electron requirement
 * /!\ This module could be extended, actually, the binding fit
 * only with our need.
*)

open Js

class type t = object
  method app : App.t Js.t readonly_prop
  method _BrowserWindow :
    ((BrowserWindow.props Js.t -> BrowserWindow.t Js.t) constr) readonly_prop
end
