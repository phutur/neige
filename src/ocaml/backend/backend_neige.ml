module Neige = Plumbing.Make.Simple(
  struct

    let entry_point =
      Toolkit.Binding.relativize
        "../neige.html"

    let dev_tool = true

    let props =
      Plumbing.Make.{
        width = 960
      ; height = 720
      ; frame = true
      ; resizable = true
      ; autoHideMenuBar = false
      ; titleBarStyle = None
      ; minWidth = None
      ; minHeight = None
      ; icon = None
      }
  end
  )

let () = Neige.run ()
