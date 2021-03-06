class type ['a] value = object
  method error : bool Js.t Js.readonly_prop
  method value : 'a Js.t Js.readonly_prop
end

class type custom_ports = object
  method navigateHistory : (Js.js_string) value Js.t Elm.Port.cmd Js.readonly_prop
  method gotoUrl : Js.js_string Js.t Elm.Port.cmd Js.readonly_prop
end

let webview = (Js.Unsafe.js_expr "window")##.webview

let app : (custom_ports Js.t, int Js.Opt.t) Elm.Runtime.app Js.t =
  Elm.Runtime.embed
    "./_dist/neige.elm.js"
    "neige-ui"
    (Elm.Values.just (Js.string "neige://home"))

let alert s =
  Dom_html.window ## alert s
  |> ignore

let _ =
  app##.ports##.navigateHistory ## subscribe (fun x ->
      let y = x##.value in alert y
    )

let _ =
  app##.ports##.gotoUrl ## subscribe (fun x ->
      Firebug.console ## log (x);
      webview ## loadURL x
    )
