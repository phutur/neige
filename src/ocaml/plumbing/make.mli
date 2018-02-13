(** Boilerplate to build Electron application *)

type main_window = BrowserWindow.t Js.t Js.Opt.t ref
type electron = Electron.t Js.t
type app = App.t Js.t

type props = {
  width: int
; height: int
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
  val on_ready : electron -> app -> main_window -> unit
  val on_closed : electron -> app -> main_window -> unit
  val on_all_closed : electron -> app -> main_window -> unit
end

module type MAKER =
sig
  val run : unit -> unit
end

module Full : functor (M : FULL_REQUIREMENT) -> MAKER
module Simple : functor (M : REQUIREMENT) -> MAKER
