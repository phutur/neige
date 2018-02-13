type 'a t = 'a option

let map f = function
  | None -> None
  | Some x -> Some (f x)
