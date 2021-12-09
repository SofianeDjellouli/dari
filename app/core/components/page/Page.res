open Ionic

@react.component
let make = (~title: string, ~children: React.element) => <>
  <Toolbar.IonHeader>
    <Toolbar.IonToolbar>
      <Toolbar.IonTitle> {React.string(title)} </Toolbar.IonTitle>
    </Toolbar.IonToolbar>
  </Toolbar.IonHeader>
  <Content.IonContent className="ion-padding">
    <div>
      <Grid.IonGrid>
        <Grid.IonRow className="ion-justify-content-center">
          <Grid.IonCol sizeMd="5" sizeLg="4"> children </Grid.IonCol>
        </Grid.IonRow>
      </Grid.IonGrid>
    </div>
  </Content.IonContent>
</>
