open Ionic

@react.component
let make = (
  ~name: string,
  ~placeholder: option<string>=?,
  ~label: string,
  ~error,
  ~value: string,
  ~onChange: ReactEvent.Form.t => unit,
  ~type_: option<[#email | #password]>=?,
  ~autofocus: option<bool>=?,
) => {
  <>
    <Item.IonItem lines=#full>
      <Item.IonLabel position=#floating> {React.string(label)} </Item.IonLabel>
      <Spread props={"type": type_}>
        <Input.IonInput name ?autofocus ?placeholder value onIonChange={onChange} />
      </Spread>
    </Item.IonItem>
    {switch error {
    | Some(err) => <span className="ion-padding"> {React.string(err)} </span>
    | None => React.null
    }}
  </>
}
