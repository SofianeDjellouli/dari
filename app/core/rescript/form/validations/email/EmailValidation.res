@module("./regex") external emailRegex: Js.Re.t = "emailRegex"

let testEmail = Js.Re.test_(emailRegex)

let invalidEmail = "Please enter a valid email address"

let make: FormState.getError = (key, field) =>
  key === "email" && !testEmail(field.value) ? invalidEmail : ""
