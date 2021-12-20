open Ionic

type errandsQueryType = unit => Promise.t<ErrandsLevelItem.errandsLevels>

@module("../queries/errands-levels")
external errandsQuery: errandsQueryType = "default"

@module("../mutations/update")
external updateErrand: ErrandsLevelItem.updateErrandType = "default"

@module("../mutations/delete")
external deleteErrand: ErrandsLevelItem.deleteErrandType = "default"

@genType("ErrandsList") @react.component
let make = () => {
  let (errandsLevels, errandsLevelsQueryExtras) = Blitz.ReactQuery.usePaginatedQuery(
    errandsQuery,
    (),
  )

  let (updateErrandMutation, _) = Blitz.ReactQuery.useMutation(updateErrand)

  let (deleteErrandMutation, _) = Blitz.ReactQuery.useMutation(deleteErrand)

  let handleUpdate = data =>
    updateErrandMutation(. data)
    ->Promise.then(_ => errandsLevelsQueryExtras.refetch())
    ->Promise.then(_ => Promise.resolve())

  let handleDelete = data =>
    deleteErrandMutation(. data)
    ->Promise.then(_ => errandsLevelsQueryExtras.refetch())
    ->Promise.then(_ => Promise.resolve())

  <Content.IonContent>
    {switch errandsLevels {
    | Some(errandsLevels) => <>
        {errandsLevels
        ->Belt.Array.map(errandLevel =>
          <ErrandsLevelItem
            key={Belt.Int.toString(errandLevel.id)}
            name=errandLevel.name
            errands=errandLevel.errands
            defaultToggled={errandLevel.name === "Missing"}
            handleUpdate
            handleDelete
          />
        )
        ->React.array}
      </>
    | None => React.null
    }}
  </Content.IonContent>
}

/* {[#Present, #Lacking, #Missing]
                  ->Array.map(e =>
                    <Checkbox.IonCheckbox
                      key={(e :> string)}
                      checked={errand.level === e}
                      slot=#end
                      onIonChange={handleCheck}
                      name={(e :> string)}
                    />
                  )
                  ->React.array} */
