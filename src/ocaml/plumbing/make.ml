type main_window = BrowserWindow.t Js.t Js.Opt.t ref
type electron = Electron.t Js.t
type app = App.t Js.t

type props = {
  width: int
; height: int
; backgroundColor: string
; frame: bool
; resizable: bool
; autoHideMenuBar: bool
; titleBarStyle: string option
; icon: string option
; minWidth: int option
; minHeight: int option
}

module type REQUIREMENT =
sig
  val entry_point : string
  val dev_tool : bool
  val props : props
end

module type FULL_REQUIREMENT =
sig
  include REQUIREMENT
  val on_ready : (electron -> app -> main_window -> unit)
  val on_closed : (electron -> app -> main_window -> unit)
  val on_all_closed : (electron -> app -> main_window -> unit)
end

module type MAKER =
sig
  val run : unit -> unit
end

module Full(M : FULL_REQUIREMENT) : MAKER =
struct

  let electron = Toolkit.Binding.require "electron"
  let app = electron##.app
  let main_window = ref Js.null

  let from_props : props -> BrowserWindow.props Js.t =
    function props ->
      let f = Toolkit.Option.map (Js.string) in
      object%js
        val width = props.width
        val height = props.height
        val backgroundColor = Js.string props.backgroundColor
        val frame = Js.bool  props.frame
        val resizable = Js.bool props.resizable
        val minWidth = Js.Optdef.option props.minWidth
        val minHeight = Js.Optdef.option props.minHeight
        val icon = Js.Optdef.option props.icon
        val titleBarStyle = Js.Optdef.option (f props.titleBarStyle)
        val autoHideMenuBar = Js.bool props.autoHideMenuBar
      end

  let attach_callback name f =
    app ## on (Js.string name) (fun () -> f electron app main_window)

  let create_window electron' app' window' =
    let constr = electron##._BrowserWindow in
    let w = new%js constr (from_props M.props) in
    let _ = main_window := Js.Opt.return w in
    Js.Opt.iter
      !main_window
      (fun window ->
         let _ = window ## loadURL (Js.string M.entry_point) in
         let _ = if M.dev_tool
           then window##.webContents ## openDevTools () in
         let _ = attach_callback "closed" M.on_closed in
         M.on_ready electron' app' window'
      )

  let on_activate electron app window =
    if !window = Js.null
    then create_window electron app window

  let run () =
    let _ = attach_callback "ready" create_window in
    let _ = attach_callback "window-all-closed" M.on_all_closed in
    let _ = attach_callback "activate" on_activate in
    ()

end

module Simple (M : REQUIREMENT) : MAKER =
struct

  module Requirement : FULL_REQUIREMENT =
  struct
    include M
    let on_ready _ _ _ = ()
    let on_closed _ _ w = w := Js.null
    let on_all_closed _ a _ = a ## quit ()
  end

  include Full(Requirement)
end
