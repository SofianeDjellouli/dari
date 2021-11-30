open Ionic

@react.component
let make = () => <>
  <Toolbar.IonHeader>
    <Toolbar.IonToolbar>
      <Toolbar.IonTitle> {React.string("Create account")} </Toolbar.IonTitle>
    </Toolbar.IonToolbar>
  </Toolbar.IonHeader>
  <Content.IonContent> <SignupForm /> </Content.IonContent>
</>
