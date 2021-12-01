open Ionic

@react.component
let make = () => <>
  <Toolbar.IonHeader>
    <Toolbar.IonToolbar>
      <Toolbar.IonTitle> {React.string("Create account")} </Toolbar.IonTitle>
    </Toolbar.IonToolbar>
  </Toolbar.IonHeader>
  <Content.IonContent className="ion-padding">
    <Grid.IonGrid>
      <Grid.IonRow className="ion-justify-content-center">
        <Grid.IonCol sizeMd="5" sizeLg="4"> <SignupForm /> </Grid.IonCol>
      </Grid.IonRow>
    </Grid.IonGrid>
  </Content.IonContent>
</>
