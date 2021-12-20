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

let presentProps = {icon: Icon.heart, name: "Present"}

let lackingProps = {icon: Icon.heartHalf, name: "Lacking"}

let missingProps = {icon: Icon.heartDislikeOutline, name: "Missing"}

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

type updateErrandPayload = {id: int, name: [#Present | #Missing | #Lacking]}

type updateErrandType = updateErrandPayload => Promise.t<unit>

type deleteErrandType = int => Promise.t<unit>

@react.component
let make = (
  ~name: string,
  ~errands: array<errand>,
  ~defaultToggled: bool,
  ~handleUpdate: updateErrandType,
  ~handleDelete: deleteErrandType,
) => {
  let (toggled, toggle) = Toggle.useToggle(~default=defaultToggled)

  let handleToggle = _ => toggle()

  let handleUpdateClick = e => ReactEvent.Mouse.currentTarget(e)["dataset"]->handleUpdate->ignore

  let handleDeleteClick = e => ReactEvent.Mouse.currentTarget(e)["dataset"]->handleDelete->ignore

  let isToggledAllowed = toggled && Js.Array.length(errands) > 0

  <List.IonList>
    {<>
      <List.IonListHeader onClick=handleToggle>
        <Item.IonLabel> <h2> {React.string(name)} </h2> </Item.IonLabel>
        <Button.IonButton shape=#round disabled={!isToggledAllowed}>
          <Icon.IonIcon
            slot=#"icon-only"
            icon={if isToggledAllowed {
              Icon.chevronDownOutline
            } else {
              Icon.chevronForwardOutline
            }}
          />
        </Button.IonButton>
      </List.IonListHeader>
      {if isToggledAllowed {
        errands
        ->Belt.Array.map(errand => {
          let props = getErrandLevelProps(errand.level)

          let {color, firstAction, secondAction} = props

          <Item.IonItemSliding key={Belt.Int.toString(errand.id)}>
            <Item.IonItemOptions side=#start>
              <Spread props={{"data-id": errand.id}}>
                <Item.IonItemOption color onClick=handleDeleteClick name="hi">
                  <Icon.IonIcon icon=Icon.trashBin />
                </Item.IonItemOption>
              </Spread>
            </Item.IonItemOptions>
            <Item.IonItem color>
              <Item.IonLabel> {React.string(errand.name)} </Item.IonLabel>
              <Spread props={{"data-name": firstAction.name, "data-id": errand.id}}>
                <Icon.IonIcon slot=#end icon=firstAction.icon onClick=handleUpdateClick />
              </Spread>
              <Spread props={{"data-name": secondAction.name, "data-id": errand.id}}>
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
