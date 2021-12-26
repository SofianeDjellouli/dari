open Ionic
open CreateErrandReducer

type iconPropsType = {icon: string, name: string}

let presentProps: iconPropsType = {icon: Icon.heart, name: "Present"}

let lackingProps: iconPropsType = {icon: Icon.heartHalf, name: "Lacking"}

let missingProps: iconPropsType = {icon: Icon.heartDislikeOutline, name: "Missing"}

let levels: array<iconPropsType> = [presentProps, lackingProps, missingProps]

@react.component
let make = (~dispatch, ~state: state) => {
  let handleNameChange = e => ReactEvent.Form.target(e)["value"]->ChangeName->dispatch

  let handleLevelChange = e => ReactEvent.Mouse.target(e)["dataset"]["name"]->ChangeLevel->dispatch

  <Item.IonItem>
    <Input.IonInput autofocus=true value=state.name onIonChange=handleNameChange />
    {levels
    ->Belt.Array.map(level =>
      <Spread props={{"data-name": level.name}} key=level.name>
        <Icon.IonIcon
          color={(state.level :> string) === level.name ? #success : #medium}
          slot=#end
          icon=level.icon
          onClick=handleLevelChange
        />
      </Spread>
    )
    ->React.array}
  </Item.IonItem>
}
