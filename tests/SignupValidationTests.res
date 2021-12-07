open Test
open Assert
open Belt
open SignupValidation
open SignupReducer

test("Validates valid state", () => {
  let stateArray = [
    ("email", {value: "myemail@gmail.com", error: ""}),
    ("password", {value: "12345678", error: ""}),
  ]

  let state = Map.String.fromArray(stateArray)

  let result = validate(state)

  let expected = []

  assertArrayEqual(result, expected)
})

test("Invalidates invalid state", () => {
  let stateArray = [
    ("email", {value: "myemail@gmail.com", error: ""}),
    ("password", {value: "", error: ""}),
  ]

  let state = Map.String.fromArray(stateArray)

  let result = validate(state)

  let expected = [{name: "password", error: "This field is required"}]

  assertArrayEqual(result, expected)
})
