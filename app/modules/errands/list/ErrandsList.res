open Ionic

type errandsQueryType = unit => Promise.t<ErrandsItem.errandsLevels>

@module("../queries/errands-levels")
external errandsQuery: errandsQueryType = "default"

type updateErrandPayload =
  | Name({id: int, name: string})
  | Level({id: int, level: [#Present | #Missing | #Lacking]})

type updateErrandType = updateErrandPayload => Promise.t<ErrandsItem.errandLevel>

@module("../mutations/update")
external updateErrand: updateErrandType = "default"

@genType("ErrandsList") @react.component
let make = () => {
  let (errandsLevels, _) = Blitz.ReactQuery.usePaginatedQuery(errandsQuery, ())

  Js.log(errandsLevels)

  /* let (updateErrandMutation, _) = Blitz.ReactQuery.useMutation(updateErrand)

  let handleCheck = (e: ReactEvent.Form.t) => {
    Js.log(ReactEvent.Form.target(e)["name"])
  } */

  <Content.IonContent>
    {switch errandsLevels {
    | Some(errandsLevels) => <>
        {errandsLevels
        ->Belt.Array.map(errandLevel =>
          <ErrandsItem
            key={Belt.Int.toString(errandLevel.id)}
            name=errandLevel.name
            errands=errandLevel.errands
            defaultToggled={errandLevel.name === "Missing"}
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
