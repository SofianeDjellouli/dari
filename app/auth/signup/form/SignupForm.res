open Ionic
open Belt

type user = {"email": string, "name": string, "role": string, "id": int}

@module("app/auth/mutations/signup")
external signup: 'a = "default"
// The latter causes a Blitz error
// external signup: (FormApi.state, Blitz.Ctx.t) => Promise.t<user> = "default"

let handleSignupFormSubmit = (signupMutation, data) => {
  /* signupMutation(. data.state.values)
  ->Promise.then(num => {
    Js.log(num)

    Promise.resolve(num)
  })
  ->Promise.catch(error => {
    Js.log(error)

    data.send(ResetForm)
    /* if error["code"] === "P2002" && error["meta"]["target"] === "email" {
          data.send(SetFieldsState)
        } */

    Promise.reject(error)
  })
  ->ignore */

  None
}

@react.component
let make = () => {
  let (signupMutation, _) = Blitz.ReactQuery.useMutation(signup)

  let (state, dispatch) = React.useReducer(SignupReducer.reducer, SignupReducer.initialState)

  let handleSubmit = (event: ReactEvent.Form.t) => {
    ReactEvent.Synthetic.preventDefault(event)

    let errors = SignupValidation.validate(state)

    if Js.Array2.length(errors) > 0 {
      errors->SetErrors->dispatch
    }
  }

  let handleChange = (e: ReactEvent.Form.t) => {
    let event = ReactEvent.Form.target(e)

    let value = event["value"]

    let name = event["name"]

    {name: name, value: value}->Change->dispatch
  }

  let getField = field => Map.String.getWithDefault(state, field, SignupReducer.field)

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
    <Button.AsyncButton color=#danger expand=#block label="Submit" isLoading=false />
  </Form>
}
