open Ionic

type errandLevelLabel = [#Present | #Lacking | #Missing]

type errand = {
  id: int,
  name: string,
  level: errandLevelLabel,
}

type errandLevel = {
  id: int,
  name: string,
  errands: array<errand>,
}

type errandsLevels = array<errandLevel>

type iconPropsType = {icon: string, name: string}

type propsType = {color: Ionic.color, firstAction: iconPropsType, secondAction: iconPropsType}

let presentProps = {icon: Icon.heart, name: "present"}

let lackingProps = {icon: Icon.heartHalf, name: "lacking"}

let missingProps = {icon: Icon.heartDislikeOutline, name: "missing"}

let getErrandLevelProps = (level: errandLevelLabel) =>
  switch level {
  | #Present => {
      color: #success,
      firstAction: lackingProps,
      secondAction: missingProps,
    }
  | #Missing => {
      color: #danger,
      firstAction: presentProps,
      secondAction: lackingProps,
    }
  | #Lacking => {
      color: #warning,
      firstAction: presentProps,
      secondAction: missingProps,
    }
  }

@react.component
let make = (
  ~name: string,
  ~errands: array<errand>,
  ~defaultToggled: bool,
  ~handleUpdate: (. string, string) => unit,
) => {
  let (toggled, toggle) = Toggle.useToggle(~default=defaultToggled)

  let handleToggle = _ => toggle()

  let handleUpdateClick = e => {
    let dataset = ReactEvent.Mouse.currentTarget(e)["dataset"]

    handleUpdate(. dataset["action"], dataset["id"])
  }

  <List.IonList>
    {<>
      <List.IonListHeader onClick=handleToggle>
        <Item.IonLabel> <h2> {React.string(name)} </h2> </Item.IonLabel>
        <Button.IonButton shape=#round>
          <Icon.IonIcon
            slot=#"icon-only"
            icon={if toggled {
              Icon.chevronDownOutline
            } else {
              Icon.chevronForwardOutline
            }}
          />
        </Button.IonButton>
      </List.IonListHeader>
      {if toggled {
        errands
        ->Belt.Array.map(errand => {
          let props = getErrandLevelProps(errand.level)

          let {color, firstAction, secondAction} = props

          <Item.IonItemSliding key={Belt.Int.toString(errand.id)}>
            <Item.IonItemOptions side=#start>
              <Item.IonItemOption color> <Icon.IonIcon icon=Icon.trashBin /> </Item.IonItemOption>
            </Item.IonItemOptions>
            <Item.IonItem color>
              <Item.IonLabel> {React.string(errand.name)} </Item.IonLabel>
              <Spread props={{"data-action": firstAction.name, "data-id": errand.id}}>
                <Icon.IonIcon slot=#end icon=firstAction.icon onClick=handleUpdateClick />
              </Spread>
              <Spread props={{"data-action": secondAction.name, "data-id": errand.id}}>
                <Icon.IonIcon slot=#end icon=secondAction.icon onClick=handleUpdateClick />
              </Spread>
            </Item.IonItem>
          </Item.IonItemSliding>
        })
        ->React.array
      } else {
        React.null
      }}
    </>}
  </List.IonList>
}
