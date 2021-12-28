open Ionic

type signupType = Js.Dict.t<string> => Promise.t<unit>

@module("../mutations/signup")
external signup: signupType = "default"

@genType("SignupForm") @react.component
let make = () => {
  let (signupMutation, data) = Blitz.ReactQuery.useMutation(~function=signup, ())

  let (state, dispatch) = React.useReducer(SignupReducer.reducer, SignupReducer.initialState)

  let handleSubmit = (event: ReactEvent.Form.t) => {
    ReactEvent.Synthetic.preventDefault(event)

    let errors = SignupValidation.validate(state)

    if Js.Array2.length(errors) > 0 {
      errors->SetErrors->dispatch
    } else {
      state->FormState.mapFieldsToDict->(e => signupMutation(. e))->ignore
    }
  }

  let handleChange = (e: ReactEvent.Form.t) => {
    let event = ReactEvent.Form.target(e)

    let value = event["value"]

    let name = event["name"]

    {name: name, value: value}->Change->dispatch
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
