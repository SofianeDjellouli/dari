let requiredField = "This field is required"

let make: FormState.getError = (_, field) =>
  Js.String.length(field.value) === 0 ? requiredField : ""
