open Ionic

type createErrandType = CreateErrandReducer.state => Promise.t<ErrandsTypes.errand>

@module("../mutations/create")
external createErrand: createErrandType = "default"

@react.component
let make = () => {
  let setSnackbar = Snackbar.useSnackbar()

  let (createErrandMutation, data) = Blitz.ReactQuery.useMutation(~function=createErrand, ())

  let (state, dispatch) = React.useReducer(
    CreateErrandReducer.reducer,
    CreateErrandReducer.initialState,
  )

  let handleToggle = _ => dispatch(Toggle)

  let handleReset = _ => dispatch(Reset)

  let handleSubmit = e => {
    ReactEvent.Form.preventDefault(e)

    createErrandMutation(. state)
    ->Promise.then(errand => {
      handleReset()

      setSnackbar(_ => `${(errand.level :> string)} ${errand.name} added`)

      Promise.resolve()
    })
    ->ignore
  }

  if state.toggled {
    <Form onSubmit=handleSubmit>
      <CreateErrandItem state dispatch />
      <Toolbar.IonToolbar>
        <Toolbar.IonButtons>
          <Button.IonButton onClick=handleReset> {React.string("Cancel")} </Button.IonButton>
          <Button.AsyncButton color=#danger label="Confirm" isLoading=data.isLoading />
        </Toolbar.IonButtons>
      </Toolbar.IonToolbar>
    </Form>
  } else {
    <Button.IonButton onClick=handleToggle> {React.string("Add Errand")} </Button.IonButton>
  }
}
