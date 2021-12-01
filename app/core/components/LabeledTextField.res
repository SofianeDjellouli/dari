open Ionic

@react.component
let make = (
  ~name: string,
  ~placeholder: option<string>=?,
  ~label: string,
  ~error: option<string>=?,
  ~value: string,
  ~onChange: ReactEvent.Form.t => unit,
) => {
  <>
    <Item.IonItem lines=#full>
      <Item.IonLabel position=#floating> {React.string(label)} </Item.IonLabel>
      <Input.IonInput name ?placeholder value onChange />
    </Item.IonItem>
    {switch error {
    | Some(err) => <span className="ion-padding"> {React.string(err)} </span>
    | None => React.null
    }}
  </>
}
