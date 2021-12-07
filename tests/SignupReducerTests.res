open Test
open Assert
open SignupReducer
open Belt

test("Handles Change action", () => {
  let stateArray = [
    ("email", {value: "", error: "Required"}),
    ("password", {value: "", error: "Required"}),
  ]

  let state = Map.String.fromArray(stateArray)

  let action = Change({name: "email", value: "myemail@gmail.com"})

  let result = reducer(state, action)

  let expectedArray = [
    ("email", {value: "myemail@gmail.com", error: ""}),
    ("password", {value: "", error: "Required"}),
  ]

  let expected = Map.String.fromArray(expectedArray)

  assertMapEqual(result, expected)
})

test("Handles SetErrors action", () => {
  let stateArray = [("email", {value: "", error: ""}), ("password", {value: "12345678", error: ""})]

  let state = Map.String.fromArray(stateArray)

  let action = SetErrors([{name: "email", error: "Required"}])

  let result = reducer(state, action)

  let expectedArray = [
    ("email", {value: "", error: "Required"}),
    ("password", {value: "12345678", error: ""}),
  ]

  let expected = Map.String.fromArray(expectedArray)

  assertMapEqual(result, expected)
})
