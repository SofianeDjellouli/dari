open Ionic

module Fields = %lenses(
  type state = {
    password: string,
    email: string,
  }
)

module FormApi = ReForm.Make(Fields)

open FormApi

type field<'a> = Fields.field<'a>

type user = {"email": string, "name": string, "role": string, "id": int}

@module("app/auth/mutations/signup")
external signup: 'a = "default"
// The latter causes a Blitz error
// external signup: (FormApi.state, Blitz.Ctx.t) => Promise.t<user> = "default"

@react.component
let make = () => {
  let (signupMutation, _) = Blitz.ReactQuery.useMutation(signup)

  let form = FormApi.use(
    ~validationStrategy=OnChange,
    ~onSubmit=data => {
      signupMutation(. data.state.values)
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
      ->ignore

      Js.log(1)

      None
    },
    ~initialState={
      password: "",
      email: "",
    },
    ~schema={
      let password = Validation.custom(state => {
        let length = Js.String2.length(state.password)

        if length < 8 {
          Error("too small")
        } else if length > 11 {
          Error("too big")
        } else {
          Valid
        }
      }, Password)

      let email = Validation.email(Email)

      [email, password]->Belt.Array.concatMany->Validation.Schema
    },
    (),
  )

  let handleSubmit = (event: ReactEvent.Form.t) => {
    ReactEvent.Synthetic.preventDefault(event)

    form.submit()
  }

  let handleField = (field: field<'a>, e: ReactEvent.Form.t) => {
    let value = ReactEvent.Form.target(e)["value"]

    form.handleChange(field, value)
  }

  let getError = field => field->ReSchema.Field->form.getFieldError

  Js.log(getError(Email))

  <Form onSubmit=handleSubmit>
    <TextField
      value=form.values.email
      onChange={handleField(Email)}
      name="Email"
      label="Email"
      type_=#email
      autofocus=true
      error={getError(Email)}
    />
    <TextField
      value=form.values.password
      onChange={handleField(Password)}
      name="password"
      label="Password"
      type_=#password
      error={getError(Password)}
    />
    <Button.AsyncButton color=#danger expand=#block label="Submit" isLoading=form.isSubmitting />
  </Form>
}
