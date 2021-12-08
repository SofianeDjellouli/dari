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

test("Invalidates empty required fields", () => {
  let stateArray = [
    ("email", {value: "myemail@gmail.com", error: ""}),
    ("password", {value: "", error: ""}),
  ]

  let state = Map.String.fromArray(stateArray)

  let result = validate(state)

  let expected = [{name: "password", error: "This field is required"}]

  assertArrayEqual(result, expected)
})

test("Invalidates too short password", () => {
  let stateArray = [
    ("email", {value: "myemail@gmail.com", error: ""}),
    ("password", {value: "1", error: ""}),
  ]

  let state = Map.String.fromArray(stateArray)

  let result = validate(state)

  let expected = [{name: "password", error: tooShortPassword}]

  assertArrayEqual(result, expected)
})

test("Invalidates too long password", () => {
  let stateArray = [
    ("email", {value: "myemail@gmail.com", error: ""}),
    ("password", {value: "1234567890123456789012345678901234567890", error: ""}),
  ]

  let state = Map.String.fromArray(stateArray)

  let result = validate(state)

  let expected = [{name: "password", error: tooLongPassword}]

  assertArrayEqual(result, expected)
})

test("Invalidates invalid email", () => {
  let stateArray = [
    ("email", {value: "myemail@gmail", error: ""}),
    ("password", {value: "123456789", error: ""}),
  ]

  let state = Map.String.fromArray(stateArray)

  let result = validate(state)

  let expected = [{name: "email", error: invalidEmail}]

  assertArrayEqual(result, expected)
})
