open Test
open Assert

test("Validates form ands take order of validators in account", () => {
  let validate = FormState.makeValidate([RequiredValidation.make, EmailValidation.make])

  let stateArray: FormState.stateArray = [("email", {value: "", error: ""})]

  let state = Belt.Map.String.fromArray(stateArray)

  let result = validate(state)

  let expectedArray: FormState.stateArray = [
    ("email", {value: "", error: RequiredValidation.requiredField}),
  ]

  let expected = Belt.Map.String.fromArray(expectedArray)

  assertDeepEqual(result, expected)
})
