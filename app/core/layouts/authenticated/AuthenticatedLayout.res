open Ionic

type logoutMutationType = unit => Promise.t<unit>

@module("../../../modules/auth/mutations/logout")
external logoutMutation: logoutMutationType = "default"

@genType("AuthenticatedLayout") @react.component
let make = (~children: React.element) => {
  let (logout, _) = Blitz.ReactQuery.useMutation(logoutMutation)

  let handleLogout = _ => logout(. ignore())->ignore

  <Menu.IonSplitPane when_="md" contentId="main-content">
    <Menu.IonMenu contentId="main-content">
      <Toolbar.MainHeader color=#primary> {React.string("Dari")} </Toolbar.MainHeader>
      <Content.IonContent>
        <List.IonList>
          <List.IonListHeader> {React.string("Navigate")} </List.IonListHeader>
          <Menu.IonMenuToggle autoHide=false>
            <AuthenticatedLayoutMenuItem href="/" icon=Icon.home label="Home" />
            <AuthenticatedLayoutMenuItem
              href="/family" icon=Icon.peopleCircleOutline label="Family"
            />
            <AuthenticatedLayoutMenuItem href="/errands" icon=Icon.bagOutline label="Errands" />
            <Item.IonItem button=true onClick=handleLogout>
              <Icon.IonIcon slot="start" icon=Icon.logOutOutline />
              <Item.IonLabel> {React.string("Logout")} </Item.IonLabel>
            </Item.IonItem>
          </Menu.IonMenuToggle>
        </List.IonList>
      </Content.IonContent>
    </Menu.IonMenu>
    <IonPage id="main-content">
      <Toolbar.IonHeader>
        <Toolbar.IonToolbar>
          <Toolbar.IonButtons slot=#start>
            <Menu.IonMenuToggle autoHide=false>
              <Button.IonButton>
                <Icon.IonIcon slot="icon-only" icon=Icon.menu />
              </Button.IonButton>
            </Menu.IonMenuToggle>
          </Toolbar.IonButtons>
          <Toolbar.IonTitle> {React.string("Header")} </Toolbar.IonTitle>
        </Toolbar.IonToolbar>
      </Toolbar.IonHeader>
      <Content.IonContent className="ion-padding"> children </Content.IonContent>
    </IonPage>
  </Menu.IonSplitPane>
}
