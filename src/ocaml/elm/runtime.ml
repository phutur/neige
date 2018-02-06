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

let embed file target flags =
  let elm = Toolkit.Binding.require file in
  let main = elm##.Main in
  let elt_opt = Dom_html.document ## getElementById (Js.string target) in
  match Js.Opt.to_option elt_opt with
  | None -> raise (Element_not_found target)
  | Some element -> main ## embed element flags
