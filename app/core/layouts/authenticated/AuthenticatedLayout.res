open Ionic

@genType("AuthenticatedLayout") @react.component
let make = (~children: React.element) =>
  <Menu.IonSplitPane when_="md" contentId="main-content">
    <Menu.IonMenu contentId="main-content">
      <Toolbar.MainHeader color=#primary> {React.string("title")} </Toolbar.MainHeader>
      <Content.IonContent>
        <List.IonList>
          <List.IonListHeader> {React.string("Navigate")} </List.IonListHeader>
          <Menu.IonMenuToggle autoHide=false>
            <Item.IonItem button=true>
              <Icon.IonIcon slot="start" icon=Icon.home />
              <Item.IonLabel> {React.string("Home")} </Item.IonLabel>
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
