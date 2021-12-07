open Belt

type field = {value: string, error: string}

type state = Map.String.t<field>

let field = {value: "", error: ""}

let stateArray = [("email", field), ("password", field)]

let initialState = Map.String.fromArray(stateArray)

type error = {
  name: string,
  error: string,
}

type action = Change({name: string, value: string}) | SetErrors(array<error>)

let reducer = (state: state, action: action) => {
  switch action {
  | Change({name, value}) => Map.String.set(state, name, {value: value, error: ""})
  | _ => initialState
  }
}
