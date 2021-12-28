let stateArray = [("email", FormState.field), ("password", FormState.field)]

let initialState = Belt.Map.String.fromArray(stateArray)

type action = Change({name: string, value: string}) | SetErrors(array<FormState.error>)

let reducer = (state: FormState.fieldState, action: action) => {
  switch action {
  | Change({name, value}) => Belt.Map.String.set(state, name, {value: value, error: ""})
  | SetErrors(errors) => {
      let findError = Js.Array2.find(errors)

      Belt.Map.String.reduce(state, state, (acc, key, value) => {
        let keyError = findError(e => e.name === key)

        switch keyError {
        | Some({error}) => Belt.Map.String.set(acc, key, {value: value.value, error: error})
        | None => acc
        }
      })
    }
  }
}
