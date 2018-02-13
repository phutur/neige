(** Binding to Elm Values *)

type 'a option = 'a Js.Opt.t

val nothing : 'a Js.Opt.t
val just : 'a -> 'a Js.Opt.t
