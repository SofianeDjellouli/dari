open Ionic

@react.component
let make = (
  ~name: string,
  ~placeholder: option<string>=?,
  ~label: string,
  ~error: string,
  ~value: string,
  ~onChange as onIonChange: ReactEvent.Form.t => unit,
  ~onBlur as onIonBlur: option<ReactEvent.Form.t => unit>=?,
  ~type_: option<[#email | #password]>=?,
  ~autofocus: option<bool>=?,
) => {
  <>
    <Item.IonItem lines=#full>
      <Item.IonLabel position=#floating> {React.string(label)} </Item.IonLabel>
      <Spread props={"type": type_}>
        <Input.IonInput name ?autofocus ?placeholder value onIonChange ?onIonBlur />
      </Spread>
    </Item.IonItem>
    <Item.IonNote className="ion-padding" color=#danger> {React.string(error)} </Item.IonNote>
  </>
}
