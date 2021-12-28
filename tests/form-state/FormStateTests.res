open Test
open Assert

test("Gets values from state", () => {
  let stateArray: FormState.stateArray = [
    ("email", {value: "myemail@gmail.com", error: ""}),
    ("password", {value: "12345678", error: ""}),
  ]

  let state = Belt.Map.String.fromArray(stateArray)

  let result = FormState.mapFieldsToDict(state)

  let expected = Js.Dict.fromArray([("email", "myemail@gmail.com"), ("password", "12345678")])

  assertDeepEqual(result, expected)
})
