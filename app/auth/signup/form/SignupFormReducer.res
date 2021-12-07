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
  | SetErrors(errors) => {
      let findError = Js.Array2.find(errors)

      Map.String.reduce(state, state, (acc, key, value) => {
        let keyError = findError(e => e.name === key)

        switch keyError {
        | Some({error}) => Map.String.set(acc, key, {value: value.value, error: error})
        | None => acc
        }
      })
    }
  }
}
