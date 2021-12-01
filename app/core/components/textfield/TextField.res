open Ionic

@react.component
let make = (
  ~name: string,
  ~placeholder: option<string>=?,
  ~label: string,
  ~error,
  ~value: string,
  ~onChange as onIonChange: ReactEvent.Form.t => unit,
  ~type_: option<[#email | #password]>=?,
  ~autofocus: option<bool>=?,
) => {
  <>
    <Item.IonItem lines=#full>
      <Item.IonLabel position=#floating> {React.string(label)} </Item.IonLabel>
      <Spread props={"type": type_}>
        <Input.IonInput name ?autofocus ?placeholder value onIonChange />
      </Spread>
    </Item.IonItem>
    <Item.IonNote className="ion-padding" color=#danger>
      {switch error {
      | Some(err) => React.string(err)
      | None => React.null
      }}
    </Item.IonNote>
  </>
}
