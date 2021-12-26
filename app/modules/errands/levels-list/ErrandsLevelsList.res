type errandsQueryType = unit => Promise.t<ErrandsTypes.errandsLevels>

@module("../queries/errands-levels")
external errandsQuery: errandsQueryType = "default"

@react.component
let make = () => {
  let (errandsLevels, errandsLevelsQueryExtras) = Blitz.ReactQuery.usePaginatedQuery(
    errandsQuery,
    (),
  )

  let refetch = errandsLevelsQueryExtras.refetch

  switch errandsLevels {
  | Some(errandsLevels) => <>
      {errandsLevels
      ->Belt.Array.map(errandLevel => {
        let {name, errands} = errandLevel

        <ErrandsLevelItem
          key={Belt.Int.toString(errandLevel.id)}
          name
          errands
          defaultToggled={errandLevel.name === "Missing"}
          refetch
        />
      })
      ->React.array}
    </>
  | None => React.null
  }
}
