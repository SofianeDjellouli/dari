open Ionic

@module("../queries/errands")
external errandsQuery: 'a = "default"

@genType("ErrandsList") @react.component
let make = () => {
  let (errands, extras) = Blitz.ReactQuery.useQuery(errandsQuery, None)

  Js.log2(errands, extras.isLoading)

  <Content.IonContent>
    <List.IonList>
      <Item.IonItem> <Item.IonLabel> {React.string("hi")} </Item.IonLabel> </Item.IonItem>
    </List.IonList>
  </Content.IonContent>
}
