open Ionic

@genType("SignupPage") @react.component
let make = () => {
  <IonPage>
    <IonHeader>
      <IonToolbar> <IonTitle> {React.string("Create account")} </IonTitle> </IonToolbar>
    </IonHeader>
    <IonContent> <SignupForm /> </IonContent>
  </IonPage>
}
