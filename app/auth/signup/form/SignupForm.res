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

@react.component
let make = () => {
  let form = FormApi.use(
    ~validationStrategy=OnChange,
    ~onSubmit={
      data => {
        Js.log(data)

        None
      }
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
    <Spread props={"type": "submit"}>
      <Button.IonButton color=#danger expand=#block> {React.string("Submit")} </Button.IonButton>
    </Spread>
  </Form>
}
