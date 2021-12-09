open SignupReducer
open Belt

let getOutput = state =>
  state->Map.String.map(value => value.value)->Map.String.toArray->Js.Dict.fromArray
