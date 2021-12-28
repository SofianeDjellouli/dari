let setError: (string, string) => array<FormState.error> = (name, error) => [
  {name: name, error: error},
]

let tooShortPassword = "Password must be at least 8 characters"

let tooLongPassword = "Password must be less than 32 characters"

let invalidEmail = "Please enter a valid email address"

let requiredField = "This field is required"

let validate: FormState.fieldState => array<FormState.error> = state =>
  state->Belt.Map.String.toArray->Js.Array2.reduce((acc, curr) => {
    let (key, val) = curr

    let addError = error => acc->Js.Array2.concat(setError(key, error))

    let length = Js.String.length(val.value)

    if length === 0 {
      addError(requiredField)
    } else if key === "password" {
      if length < 8 {
        addError(tooShortPassword)
      } else if length > 32 {
        addError(tooLongPassword)
      } else {
        acc
      }
    } else if key === "email" && !Validations.testEmail(val.value) {
      addError(invalidEmail)
    } else {
      acc
    }
  }, [])
