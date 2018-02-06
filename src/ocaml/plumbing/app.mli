(** Control your application's event lifecycle.
 * /!\ This module could be extended, actually, the binding fit
 * only with our need.
*)

open Js

(** Control your application's event lifecycle. *)
class type t = object
  method quit : unit -> unit meth
  method on : js_string Js.t -> (unit -> unit) -> unit meth
end
