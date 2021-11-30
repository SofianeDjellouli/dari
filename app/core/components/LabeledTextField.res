open Ionic

@react.component
let make = (~name: string, ~placeholder: string, ~label: string) => {
  <>
    <Item.IonItem lines=#full>
      <Item.IonLabel position=#floating> {React.string(label)} </Item.IonLabel>
      <Input.IonInput name placeholder />
    </Item.IonItem>
    <span className="ion-padding"> {React.string("err")} </span>
  </>
}
