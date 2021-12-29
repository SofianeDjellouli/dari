open Ionic

type signupType = Js.Dict.t<string> => Promise.t<unit>

@module("../mutations/signup")
external signup: signupType = "default"

@genType("SignupForm") @react.component
let make = () => {
  let (signupMutation, data) = Blitz.ReactQuery.useMutation(~function=signup, ())

  let (state, dispatch) = React.useReducer(FormState.reducer, SignupReducer.initialState)

  let handleSubmit = (event: ReactEvent.Form.t) => {
    ReactEvent.Synthetic.preventDefault(event)

    let validatedState = SignupValidation.validate(state)

    if FormState.isValidForm(validatedState) {
      FormState.mapFieldsToMutation(state, signupMutation)
    } else {
      validatedState->#SetState->dispatch
    }
  }

  let handleChange = (e: ReactEvent.Form.t) => {
    let event = ReactEvent.Form.target(e)

    let value = event["value"]

    let name = event["name"]

    {name: name, value: value}->#Change->dispatch
  }

  let getField = field => Belt.Map.String.getWithDefault(state, field, FormState.field)

  let getValue = field => getField(field).value

  let getError = field => getField(field).error

  <Form onSubmit=handleSubmit>
    <TextField
      value={getValue("email")}
      onChange={handleChange}
      name="email"
      label="Email"
      type_=#email
      autofocus=true
      error={getError("email")}
    />
    <TextField
      value={getValue("password")}
      onChange={handleChange}
      name="password"
      label="Password"
      type_=#password
      error={getError("password")}
    />
    <Button.AsyncButton color=#danger expand=#block label="Submit" isLoading=data.isLoading />
  </Form>
}
