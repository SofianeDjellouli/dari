open Ionic

type errand = {
  id: int,
  name: string,
  level: [#Present | #Lacking | #Missing],
}

type errandLevel = {
  id: int,
  name: string,
  errands: array<errand>,
}

type errandsLevels = array<errandLevel>

type propsType = {color: Ionic.color, firstAction: string, secondAction: string}

@react.component
let make = (~name: string, ~errands: array<errand>, ~defaultToggled: bool) => {
  let (toggled, toggle) = Toggle.useToggle(~default=defaultToggled)

  let handleToggle = _ => toggle()

  <List.IonList>
    {<>
      <List.IonListHeader onClick=handleToggle>
        <Item.IonLabel> {React.string(name)} </Item.IonLabel>
        <Button.IonButton shape=#round>
          <Icon.IonIcon
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
          let props = switch errand.level {
          | #Present => {
              color: #success,
              firstAction: Icon.heartDislikeOutline,
              secondAction: Icon.heartHalf,
            }
          | #Missing => {
              color: #danger,
              firstAction: Icon.heart,
              secondAction: Icon.heartHalf,
            }
          | #Lacking => {
              color: #warning,
              firstAction: Icon.heart,
              secondAction: Icon.heartDislikeOutline,
            }
          }

          let color = props.color

          <Item.IonItemSliding key={Belt.Int.toString(errand.id)}>
            <Item.IonItemOptions side=#start>
              <Item.IonItemOption color> <Icon.IonIcon icon=Icon.trashBin /> </Item.IonItemOption>
            </Item.IonItemOptions>
            <Item.IonItem color>
              <Item.IonLabel> {React.string(errand.name)} </Item.IonLabel>
            </Item.IonItem>
            <Item.IonItemOptions side=#end>
              <Item.IonItemOption color>
                <Icon.IonIcon icon=props.firstAction />
              </Item.IonItemOption>
              <Item.IonItemOption color>
                <Icon.IonIcon icon=props.secondAction />
              </Item.IonItemOption>
            </Item.IonItemOptions>
          </Item.IonItemSliding>
        })
        ->React.array
      } else {
        React.null
      }}
    </>}
  </List.IonList>
}
