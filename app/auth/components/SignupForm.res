open Ionic

module FormFields = %lenses(
  type state = {
    password: string,
    email: string,
  }
)

module UserForm = ReForm.Make(FormFields)
module Validation = UserForm.Validation

@react.component
let make = () => {
  let form = UserForm.use(
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
      let password = Validation.nonEmpty(Password)

      let email = Validation.email(Email)

      Schema(Belt.Array.concat(email, password))
    },
    (),
  )

  let handleField = (field: FormFields.field<'a>, e: ReactEvent.Form.t) => {
    let value = ReactEvent.Form.target(e)["value"]

    form.handleChange(field, value)
  }

  let handleSubmit = (event: ReactEvent.Form.t) => {
    ReactEvent.Synthetic.preventDefault(event)

    form.submit()
  }

  <Form onSubmit={handleSubmit}>
    <TextField
      value={form.values.email}
      onChange={handleField(Email)}
      name="Email"
      label="Email"
      type_=#email
      autofocus={true}
    />
    <TextField
      value={form.values.password}
      onChange={handleField(Password)}
      name="password"
      label="Password"
      type_=#password
    />
    <Grid.IonRow>
      <Grid.IonCol>
        <Spread props={"type": "submit"}>
          <Button.IonButton color=#danger expand=#block>
            {React.string("Submit")}
          </Button.IonButton>
        </Spread>
      </Grid.IonCol>
    </Grid.IonRow>
  </Form>
}
