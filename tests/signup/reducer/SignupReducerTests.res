open Test
open Assert
open SignupReducer

test("Handles Change action", () => {
  let stateArray: FormState.stateArray = [
    ("email", {value: "", error: "Required"}),
    ("password", {value: "", error: "Required"}),
  ]

  let state = Belt.Map.String.fromArray(stateArray)

  let action = Change({name: "email", value: "myemail@gmail.com"})

  let result = reducer(state, action)

  let expectedArray: FormState.stateArray = [
    ("email", {value: "myemail@gmail.com", error: ""}),
    ("password", {value: "", error: "Required"}),
  ]

  let expected = Belt.Map.String.fromArray((expectedArray: FormState.stateArray))

  assertMapEqual(result, expected)
})

test("Handles SetErrors action", () => {
  let stateArray: FormState.stateArray = [
    ("email", {value: "", error: ""}),
    ("password", {value: "12345678", error: ""}),
  ]

  let state = Belt.Map.String.fromArray(stateArray)

  let action = SetErrors([{name: "email", error: "Required"}])

  let result = reducer(state, action)

  let expectedArray: FormState.stateArray = [
    ("email", {value: "", error: "Required"}),
    ("password", {value: "12345678", error: ""}),
  ]

  let expected = Belt.Map.String.fromArray((expectedArray: FormState.stateArray))

  assertMapEqual(result, expected)
})
