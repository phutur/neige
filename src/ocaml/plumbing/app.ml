open Js

class type t = object
  method quit : unit -> unit meth
  method on : js_string Js.t -> (unit -> unit) -> unit meth
end
