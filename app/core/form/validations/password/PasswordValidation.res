let tooShortPassword = "Password must be at least 8 characters"

let tooLongPassword = "Password must be less than 32 characters"

let make: FormState.getError = (key, field) =>
  if key === "password" {
    let length = Js.String.length(field.value)

    length < 8 ? tooShortPassword : length > 32 ? tooLongPassword : ""
  } else {
    ""
  }
