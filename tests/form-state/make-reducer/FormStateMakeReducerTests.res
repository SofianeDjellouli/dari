open Test
open Assert

type testAction = FormState.basicAction<
  [#Change(FormState.changePayload) | #SetState(FormState.fieldState) | #Empty | #SetEmail(string)],
>

let emptyReducer = (state, action: testAction) =>
  switch action {
  | #Empty => Belt.Map.String.empty
  | _ => state
  }

let makeSetEmailReducer = (next, state, action: testAction) =>
  switch action {
  | #SetEmail(email) =>
    Belt.Map.String.set(state, "email", ({value: email, error: ""}: FormState.field))
  | _ => next(state, action)
  }

let reducer: (FormState.fieldState, testAction) => FormState.fieldState =
  emptyReducer->makeSetEmailReducer->FormState.makeReducer

test("Handles Change action", () => {
  let stateArray: FormState.stateArray = [
    ("email", {value: "", error: "Required"}),
    ("password", {value: "", error: "Required"}),
  ]

  let state = Belt.Map.String.fromArray(stateArray)

  let payload: FormState.changePayload = {name: "email", value: "myemail@gmail.com"}

  let action = #Change(payload)

  let result = reducer(state, action)

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

  let result = reducer(state, action)

  assertMapEqual(result, newState)
})

test("Handles Empty action", () => {
  let stateArray: FormState.stateArray = [
    ("email", {value: "", error: ""}),
    ("password", {value: "12345678", error: ""}),
  ]

  let state = Belt.Map.String.fromArray(stateArray)

  let newState = Belt.Map.String.empty

  let action = #Empty

  let result = reducer(state, action)

  assertMapEqual(result, newState)
})

test("Handles SetEmail action", () => {
  let stateArray: FormState.stateArray = [
    ("email", {value: "", error: ""}),
    ("password", {value: "12345678", error: ""}),
  ]

  let state = Belt.Map.String.fromArray(stateArray)

  let newStateArray: FormState.stateArray = [
    ("email", {value: "test@test.com", error: ""}),
    ("password", {value: "12345678", error: ""}),
  ]

  let newState = Belt.Map.String.fromArray(newStateArray)

  let action = #SetEmail("test@test.com")

  let result = reducer(state, action)

  assertMapEqual(result, newState)
})
