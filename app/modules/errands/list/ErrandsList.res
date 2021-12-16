open Ionic

type errand = {
  id: int,
  name: string,
  level: [#Present | #Missing | #Lacking],
}

type errandsQueryType = unit => Promise.t<array<errand>>

@module("../queries/errands")
external errandsQuery: errandsQueryType = "default"

@genType("ErrandsList") @react.component
let make = () => {
  let (errands, extras) = Blitz.ReactQuery.usePaginatedQuery(errandsQuery, ())

  Js.log2(errands, extras.isLoading)

  let handleCheck = (e: ReactEvent.Form.t) => {
    Js.log(ReactEvent.Form.target(e)["name"])
  }

  <Content.IonContent>
    {switch errands {
    | Some(errands) =>
      <List.IonList>
        {errands
        ->Belt.Array.map(errand => {
          let color = switch errand.level {
          | #Present => #success
          | #Missing => #warning
          | #Lacking => #danger
          }

          <Item.IonItem key={Belt.Int.toString(errand.id)} color>
            <Item.IonLabel> {React.string(errand.name)} </Item.IonLabel>
            {[#Present, #Lacking, #Missing]
            ->Belt.Array.map(e =>
              <Checkbox.IonCheckbox
                key={(e :> string)}
                checked={errand.level === e}
                slot=#end
                onIonChange={handleCheck}
                name={(e :> string)}
              />
            )
            ->React.array}
          </Item.IonItem>
        })
        ->React.array}
      </List.IonList>
    | None => React.null
    }}
  </Content.IonContent>
}
