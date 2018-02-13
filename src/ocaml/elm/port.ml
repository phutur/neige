(** Typed Elm Port *)

open Js

class type ['a] cmd_t = object
  method subscribe : ('a -> unit) -> unit meth
end

class type ['a] sub_t = object
  method send : 'a -> unit meth
end

type 'a cmd = 'a cmd_t t
type 'a sub = 'a sub_t t
