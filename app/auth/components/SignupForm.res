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
      state => {
        Js.log(state.state)

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

  let handleField = (v, e) => form.handleChange(v, (e->ReactEvent.Form.target)["value"])

  let handleSubmit = event => {
    ReactEvent.Synthetic.preventDefault(event)
    Js.log(1)
    form.submit()
  }

  <form onSubmit={handleSubmit}>
    <LabeledTextField
      value={form.values.email} onChange={handleField(Email)} name="Email" label="email"
    />
    <LabeledTextField
      value={form.values.password} onChange={handleField(Password)} name="password" label="Password"
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
  </form>
}
