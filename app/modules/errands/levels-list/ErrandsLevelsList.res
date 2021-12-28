type errandsQueryType = unit => Promise.t<ErrandsTypes.errandsLevels>

@module("../queries/errands-levels")
external errandsLevelsQuery: errandsQueryType = "default"

@react.component
let make = () => {
  let (errandsLevels, _) = Blitz.ReactQuery.usePaginatedQuery(errandsLevelsQuery, ())

  switch errandsLevels {
  | Some(errandsLevels) => <>
      {errandsLevels
      ->Belt.Array.map(errandLevel => {
        let {name, errands} = errandLevel

        <ErrandsLevelItem
          key={Belt.Int.toString(errandLevel.id)}
          defaultToggled={errandLevel.name === "Missing"}
          name
          errands
        />
      })
      ->React.array}
    </>
  | None => React.null
  }
}
