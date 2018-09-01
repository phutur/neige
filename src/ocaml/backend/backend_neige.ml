module Neige = Plumbing.Make.Simple(
  struct

    let hardware_acceleration = true

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
      ; backgroundColor = "#000"
      ; autoHideMenuBar = false
      ; titleBarStyle = Some "hidden"
      ; minWidth = None
      ; minHeight = None
      ; icon = None
      ; vibrancy = Some "dark"
      }
  end
  )

let () = Neige.run ()
