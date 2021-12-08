open SignupReducer
open Belt

let tooShortPassword = "Password must be at least 8 characters"

let tooLongPassword = "Password must be less than 32 characters"

let invalidEmail = "Please enter a valid email address"

let validate: state => array<error> = state =>
  state->Map.String.toArray->Js.Array2.reduce((acc, curr) => {
    let (key, {value}) = curr

    let length = Js.String.length(value)

    if length === 0 {
      Js.Array2.concat(acc, [{name: key, error: "This field is required"}])
    } else if key === "password" {
      if length < 8 {
        Js.Array2.concat(acc, [{name: key, error: tooShortPassword}])
      } else if length > 32 {
        Js.Array2.concat(acc, [{name: key, error: tooLongPassword}])
      } else {
        acc
      }
    } else if key === "email" && !Validations.testEmail(value) {
      Js.Array2.concat(acc, [{name: key, error: invalidEmail}])
    } else {
      acc
    }
  }, [])
