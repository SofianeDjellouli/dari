type color = [
  | #primary
  | #secondary
  | #tertiary
  | #success
  | #warning
  | #danger
  | #light
  | #medium
  | #dark
]

type slot = [
  | #primary
  | #secondary
  | #end
  | #start
]

type side = [#end | #start]

type lines = [#full | #inset | #none]

type expand = [#block | #full]

type fill = [#clear | #default | #outline | #solid]

type onFormEvent = ReactEvent.Form.t => unit

type onClickEvent = ReactEvent.Mouse.t => unit
