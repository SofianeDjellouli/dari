type errandLevelLabel = [#Present | #Lacking | #Missing]

type errand = {
  id: int,
  name: string,
  level: errandLevelLabel,
}

type errands = array<errand>

type errandLevel = {
  id: int,
  name: string,
  errands: errands,
}

type errandsLevels = array<errandLevel>
