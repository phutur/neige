type 'a option = 'a Js.Opt.t

let nothing = Js.null
let just = Js.Opt.return
