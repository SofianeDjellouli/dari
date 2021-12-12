open Ionic

@react.component
let make = (~href: string, ~icon: string, ~label: string) =>
  <Blitz.Link href>
    <Item.IonItem button=true>
      <Icon.IonIcon slot="start" icon /> <Item.IonLabel> {React.string(label)} </Item.IonLabel>
    </Item.IonItem>
  </Blitz.Link>
