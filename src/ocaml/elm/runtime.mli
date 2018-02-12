(** Binding to build an Elm Application *)

open Js

exception Element_not_found of string

class type ['ports, 'flags] app = object
  method ports: 'ports readonly_prop
end

class type ['ports, 'flags] entry_point = object
  method embed : 'a Js.t -> ('ports, 'flags) app Js.meth
end

class type ['ports, 'flags] t = object
  method _Main : ('ports, 'flags) entry_point readonly_prop
end

val embed : string -> string -> 'flags -> ('ports, 'flags) app Js.t
