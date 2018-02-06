class type custom_ports = object
  method send : int Elm.Port.cmd Js.readonly_prop
  method receive : int Elm.Port.sub Js.readonly_prop
end

let app : (custom_ports Js.t, int Js.Opt.t) Elm.Runtime.app Js.t =
  Elm.Runtime.embed
    "./_dist/neige.elm.js"
    "entry_point"
    (Js.Opt.return 10)

let _ =
  app##.ports##.send ## subscribe (fun x ->
      let _ = Firebug.console##log x in
      app##.ports##.receive ## send (x + 1)
    )
  |> ignore
