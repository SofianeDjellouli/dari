let useToggle = (~default: bool=false) => {
  let (toggled, setToggled) = React.useState(_ => default)

  let toggle = _ => setToggled(current => !current)

  (toggled, toggle)
}
