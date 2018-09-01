(** Create and control browser windows.
 * /!\ This module could be extended, actually, the binding fit
 * only with our need.
 *)

open Js

(** Render and control web pages. *)
class type webContents = object
  method openDevTools : unit -> unit meth
end

(** Describe the props for a BrowserWindow's controller *)
class type props = object
  method width : int readonly_prop
  method height: int readonly_prop
  method backgroundColor: Js.js_string Js.t readonly_prop
  method minWidth : (int Optdef.t) readonly_prop
  method minHeight : (int Optdef.t) readonly_prop
  method frame: bool Js.t readonly_prop
  method resizable: bool Js.t readonly_prop
  method autoHideMenuBar : bool Js.t readonly_prop
  method titleBarStyle : (Js.js_string Js.t Optdef.t) readonly_prop
  method icon : (Js.js_string Js.t Optdef.t) readonly_prop
  method vibrancy : (Js.js_string Js.t Optdef.t) readonly_prop
end


(** Create and control browser windows *)
class type t = object
  method loadURL : js_string Js.t -> unit meth
  method on : js_string Js.t -> (unit -> unit) -> unit meth
  method webContents : webContents Js.t readonly_prop
end
