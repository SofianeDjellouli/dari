open Ionic
open Belt
open Promise

type signupType = Js.Dict.t<string> => Promise.t<unit>

@module("../mutations/signup")
external signup: 'a = "default"

@genType("SignupForm") @react.component
let make = () => {
  let setSnackbar = Snackbar.useSnackbar()

  let (signupMutation, data) = Blitz.ReactQuery.useMutation(signup)

  let (state, dispatch) = React.useReducer(SignupReducer.reducer, SignupReducer.initialState)

  let handleSubmit = (event: ReactEvent.Form.t) => {
    ReactEvent.Synthetic.preventDefault(event)

    let errors = SignupValidation.validate(state)

    if Js.Array2.length(errors) > 0 {
      errors->SetErrors->dispatch
    } else {
      state
      ->SignupOutput.getOutput
      ->signupMutation
      ->Promise.then(num => {
        Js.log(num)

        Promise.resolve(num)
      })
      ->Promise.catch(rawError => {
        switch rawError {
        | JsError(error) =>
          switch Js.Exn.message(error) {
          | Some(message) => setSnackbar(_ => message)
          | None => setSnackbar(_ => "Some unknown error")
          }
        | _ => setSnackbar(_ => "Some unknown error")
        }

        Promise.reject(rawError)
      })
      ->ignore
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
    <Button.AsyncButton color=#danger expand=#block label="Submit" isLoading=data.isLoading />
  </Form>
}
