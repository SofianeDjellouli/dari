type level = ErrandsTypes.errandLevelLabel

type state = {
  name: string,
  level: level,
  toggled: bool,
}

type action =
  | ChangeName(string)
  | ChangeLevel(level)
  | Toggle
  | Reset

let initialState: state = {name: "", level: #Present, toggled: false}

let reducer = (state: state, action: action) =>
  switch action {
  | ChangeName(name) => {...state, name: name}
  | ChangeLevel(level) => {...state, level: level}
  | Toggle => {...state, toggled: !state.toggled}
  | Reset => initialState
  }
