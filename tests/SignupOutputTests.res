open Test
open Assert
open Belt
open SignupOutput
open SignupReducer

test("Gets values from state", () => {
  let stateArray = [
    ("email", {value: "myemail@gmail.com", error: ""}),
    ("password", {value: "12345678", error: ""}),
  ]

  let state = Map.String.fromArray(stateArray)

  let result = getOutput(state)

  let expected = Js.Dict.fromArray([("email", "myemail@gmail.com"), ("password", "12345678")])

  assertDeepEqual(result, expected)
})
