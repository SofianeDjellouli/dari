type field = {value: string, error: string}

let field = {value: "", error: ""}

type fieldState = Belt.Map.String.t<field>

type stateArray = array<(string, field)>

type fieldArray = array<field>

let mapFieldsToMutation = (
  state: fieldState,
  mutation: (. Js.Dict.t<string>) => Promise.t<unit>,
): unit =>
  state
  ->Belt.Map.String.map(e => e.value)
  ->Belt.Map.String.toArray
  ->Js.Dict.fromArray
  ->(e => mutation(. e))
  ->ignore

type getError = (string, field) => string

let makeValidate = (errorGetters: array<getError>, state: fieldState) =>
  state->Belt.Map.String.mapWithKey((key, field) => {
    let error =
      errorGetters->Belt.Array.reduce("", (acc, curr) => acc === "" ? curr(key, field) : acc)

    {...field, error: error}
  })

let isValidForm = state => state->Belt.Map.String.every((_, field) => field.error === "")
