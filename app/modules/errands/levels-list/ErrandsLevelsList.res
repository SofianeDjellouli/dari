open Ionic

type errandsQueryType = unit => Promise.t<ErrandsTypes.errandsLevels>

@module("../queries/errands-levels")
external errandsQuery: errandsQueryType = "default"

@genType("ErrandsLevelsList") @react.component
let make = () => {
  let (toggled, toggle) = Toggle.useToggle(~default=false)

  let (errandsLevels, errandsLevelsQueryExtras) = Blitz.ReactQuery.usePaginatedQuery(
    errandsQuery,
    (),
  )

  let refetch = errandsLevelsQueryExtras.refetch

  <Content.IonContent>
    <Button.IonButton onClick={_ => toggle()}> {React.string("Open")} </Button.IonButton>
    <Popover.IonPopover isOpen=toggled onDidDismiss={_ => toggle()}>
      <p> {React.string("This is popover content")} </p>
    </Popover.IonPopover>
    {switch errandsLevels {
    | Some(errandsLevels) => <>
        {errandsLevels
        ->Belt.Array.map(errandLevel =>
          <ErrandsLevelItem
            key={Belt.Int.toString(errandLevel.id)}
            name=errandLevel.name
            errands=errandLevel.errands
            defaultToggled={errandLevel.name === "Missing"}
            refetch
          />
        )
        ->React.array}
      </>
    | None => React.null
    }}
  </Content.IonContent>
}
