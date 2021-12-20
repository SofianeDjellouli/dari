let messageState = Recoil.atom({
  key: "snackbarMessage",
  default: "",
})

let useSnackbar = () => Recoil.useSetRecoilState(messageState)

@genType("Snackbar") @react.component
let make = () => {
  let (message, setMessage) = Recoil.useRecoilState(messageState)

  let onDidPresent = () => {
    let _ = Js.Global.setTimeout(() => setMessage(_ => ""), 10000)
  }

  <Ionic.Toast.IonToast message onDidPresent isOpen={message !== ""} />
}
