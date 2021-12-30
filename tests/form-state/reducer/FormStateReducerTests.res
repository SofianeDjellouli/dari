open Test
open Assert

test("Handles Change action", () => {
  let stateArray: FormState.stateArray = [
    ("email", {value: "", error: "Required"}),
    ("password", {value: "", error: "Required"}),
  ]

  let state = Belt.Map.String.fromArray(stateArray)

  let payload: FormState.changePayload = {name: "email", value: "myemail@gmail.com"}

  let action = #Change(payload)

  let result = FormState.reducer(state, action)

  let expectedArray: FormState.stateArray = [
    ("email", {value: "myemail@gmail.com", error: ""}),
    ("password", {value: "", error: "Required"}),
  ]

  let expected = Belt.Map.String.fromArray((expectedArray: FormState.stateArray))

  assertMapEqual(result, expected)
})

test("Handles SetState action", () => {
  let stateArray: FormState.stateArray = [
    ("email", {value: "", error: ""}),
    ("password", {value: "12345678", error: ""}),
  ]

  let state = Belt.Map.String.fromArray(stateArray)

  let newStateArray: FormState.stateArray = [
    ("email", {value: "", error: "required"}),
    ("password", {value: "12345678", error: ""}),
  ]

  let newState = Belt.Map.String.fromArray(newStateArray)

  let action = #SetState(newState)

  let result = FormState.reducer(state, action)

  assertMapEqual(result, newState)
})
