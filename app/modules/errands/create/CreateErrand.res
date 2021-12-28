open Ionic

type createErrandType = CreateErrandReducer.state => Promise.t<ErrandsTypes.errand>

@module("../mutations/create")
external createErrand: createErrandType = "default"

@react.component
let make = () => {
  let setSnackbar = Snackbar.useSnackbar()

  let (state, dispatch) = React.useReducer(
    CreateErrandReducer.reducer,
    CreateErrandReducer.initialState,
  )

  let handleToggle = _ => dispatch(Toggle)

  let handleReset = _ => dispatch(Reset)

  let (createErrandMutation, data) = Blitz.ReactQuery.useMutation(
    ~function=createErrand,
    ~onSuccess=(errand, _, _) => {
      handleReset()

      setSnackbar(_ => `${(errand.level :> string)} ${errand.name} added`)

      ignore()
    },
    (),
  )

  let handleSubmit = e => {
    ReactEvent.Form.preventDefault(e)

    createErrandMutation(. state)->ignore
  }

  if state.toggled {
    <Form onSubmit=handleSubmit>
      <CreateErrandItem state dispatch />
      <Toolbar.IonToolbar>
        <Toolbar.IonButtons slot=#end>
          <Button.IonButton onClick=handleReset> {React.string("Cancel")} </Button.IonButton>
          <Button.AsyncButton color=#danger label="Confirm" isLoading=data.isLoading />
        </Toolbar.IonButtons>
      </Toolbar.IonToolbar>
    </Form>
  } else {
    <Button.IonButton onClick=handleToggle> {React.string("Add Errand")} </Button.IonButton>
  }
}
