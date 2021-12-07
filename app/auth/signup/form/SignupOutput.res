open SignupReducer
open Belt

let getOutput = state => Map.String.map(state, value => value.value)
