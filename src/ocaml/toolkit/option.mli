(** Combinators for Option *)

type 'a t = 'a option
val map : ('a -> 'b) -> 'a option -> 'b option
