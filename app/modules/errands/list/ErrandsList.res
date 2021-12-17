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

type errandsQueryType = unit => Promise.t<errandsLevels>

@module("../queries/errands-levels")
external errandsQuery: errandsQueryType = "default"

type updateErrandPayload =
  | Name({id: int, name: string})
  | Level({id: int, level: [#Present | #Missing | #Lacking]})

type updateErrandType = updateErrandPayload => Promise.t<errandLevel>

@module("../mutations/update")
external updateErrand: updateErrandType = "default"

@genType("ErrandsList") @react.component
let make = () => {
  let (errandsLevels, extras) = Blitz.ReactQuery.usePaginatedQuery(errandsQuery, ())

  Js.log(errandsLevels)

  let (updateErrandMutation, _) = Blitz.ReactQuery.useMutation(updateErrand)

  let handleCheck = (e: ReactEvent.Form.t) => {
    Js.log(ReactEvent.Form.target(e)["name"])
  }

  <Content.IonContent>
    {switch errandsLevels {
    | Some(errandsLevels) => <>
        {errandsLevels
        ->Belt.Array.map(errandsLevel =>
          <List.IonList key={Belt.Int.toString(errandsLevel.id)}>
            {errandsLevel.errands
            ->Belt.Array.map(errand => {
              let color = switch errand.level {
              | #Present => #success
              | #Missing => #danger
              | #Lacking => #warning
              }

              <Item.IonItem key={Belt.Int.toString(errand.id)} color>
                <Item.IonLabel> {React.string(errand.name)} </Item.IonLabel>
              </Item.IonItem>
            })
            ->React.array}
          </List.IonList>
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
