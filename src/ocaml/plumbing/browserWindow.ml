open Js

class type webContents = object
  method openDevTools : unit -> unit meth
end

class type props = object
  method width : int readonly_prop
  method height: int readonly_prop
  method minWidth : (int Js.Optdef.t) readonly_prop
  method minHeight : (int Js.Optdef.t) readonly_prop
  method frame: bool t readonly_prop
  method resizable: bool t readonly_prop
end

class type t = object
  method loadURL : js_string Js.t -> unit meth
  method on : js_string Js.t -> (unit -> unit) -> unit meth
  method webContents : webContents Js.t readonly_prop
end
