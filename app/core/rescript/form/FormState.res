type field = {value: string, error: string}

let field = {value: "", error: ""}

type fieldState = Belt.Map.String.t<field>

type stateArray=array<(string,field)>

type fieldArray=array<field>

let mapFieldsToDict = (state: fieldState) =>
  state->Belt.Map.String.map(e => e.value)->Belt.Map.String.toArray->Js.Dict.fromArray

type error = {
  name: string,
  error: string,
}

type errorsArray=array<error>
