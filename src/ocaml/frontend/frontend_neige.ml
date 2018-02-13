class type custom_ports = object
end

let app : (custom_ports Js.t, int Js.Opt.t) Elm.Runtime.app Js.t =
  Elm.Runtime.embed
    "./_dist/neige.elm.js"
    "neige-ui"
    Elm.Values.nothing
