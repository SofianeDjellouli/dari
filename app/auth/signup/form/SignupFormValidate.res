open SignupFormReducer
open Belt

let validate: state => array<error> = state =>
  state->Map.String.toArray->Js.Array2.reduce((acc, curr) => {
    let (key, {value}) = curr

    if value === "" {
      Js.Array2.concat(acc, [{name: key, error: "This field is required"}])
    } else {
      acc
    }
  }, [])
