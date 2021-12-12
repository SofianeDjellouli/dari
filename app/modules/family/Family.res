open Ionic

@genType("Family") @react.component
let make = () =>
  <Content.IonContent>
    <List.IonList>
      <Item.IonItem> <Item.IonLabel> {React.string("hi")} </Item.IonLabel> </Item.IonItem>
    </List.IonList>
  </Content.IonContent>
