open Ionic

@module external styles: {..} = "./index.module.scss"

@genType("UnauthenticatedLayout") @react.component
let make = (~title: string, ~children: React.element) => <>
  <Toolbar.MainHeader> {React.string(title)} </Toolbar.MainHeader>
  <Content.IonContent>
    <div className={styles["wrapper"]}>
      <Grid.IonGrid className={Clsx.classes(["ion-padding"])}>
        <Grid.IonRow className="ion-justify-content-center">
          <Grid.IonCol sizeMd="5" sizeLg="4"> children </Grid.IonCol>
        </Grid.IonRow>
      </Grid.IonGrid>
    </div>
  </Content.IonContent>
</>
