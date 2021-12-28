let stateArray = [("email", FormState.field), ("password", FormState.field)]

let initialState = Belt.Map.String.fromArray(stateArray)

type action = Change({name: string, value: string}) | SetState(FormState.fieldState)

let reducer = (state: FormState.fieldState, action: action) => {
  switch action {
  | Change({name, value}) => Belt.Map.String.set(state, name, {value: value, error: ""})
  | SetState(newState) => newState
  }
}
