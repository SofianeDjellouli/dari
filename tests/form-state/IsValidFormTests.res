open Test
open Assert

test("Detects valid form", () => {
  let stateArray: FormState.stateArray = [
    ("email", {value: "myemail@gmail.com", error: ""}),
    ("password", {value: "12345678", error: ""}),
  ]

  let state = Belt.Map.String.fromArray(stateArray)

  let result = FormState.isValidForm(state)

  let expected = true

  assertDeepEqual(result, expected)
})

test("Detects invalid form", () => {
  let stateArray: FormState.stateArray = [
    ("email", {value: "myemail@gmail.com", error: ""}),
    ("password", {value: "", error: "error"}),
  ]

  let state = Belt.Map.String.fromArray(stateArray)

  let result = FormState.isValidForm(state)

  let expected = false

  assertDeepEqual(result, expected)
})
