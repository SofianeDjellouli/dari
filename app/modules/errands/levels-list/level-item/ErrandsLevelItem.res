open Ionic

@react.component
let make = (~name: string, ~errands: ErrandsTypes.errands, ~defaultToggled: bool) => {
  let (errandsToggled, toggleErrands) = Toggle.useToggle(~default=defaultToggled, ())

  <List.IonList>
    {<>
      <List.IonListHeader onClick=toggleErrands>
        <Item.IonLabel> <h2> {React.string(name)} </h2> </Item.IonLabel>
        {if Js.Array.length(errands) > 0 {
          <Button.IonButton shape=#round>
            <Icon.IonIcon
              slot=#"icon-only"
              icon={if errandsToggled {
                Icon.chevronDownOutline
              } else {
                Icon.chevronForwardOutline
              }}
            />
          </Button.IonButton>
        } else {
          React.null
        }}
      </List.IonListHeader>
      {if errandsToggled {
        errands
        ->Belt.Array.map(errand => <ErrandItem key={errand.id->Belt.Int.toString} errand />)
        ->React.array
      } else {
        React.null
      }}
    </>}
  </List.IonList>
}
