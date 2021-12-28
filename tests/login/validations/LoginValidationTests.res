open Test
open Assert

test("Validates valid state", () => {
  let stateArray: FormState.stateArray = [
    ("email", {value: "myemail@gmail.com", error: ""}),
    ("password", {value: "12345678", error: ""}),
  ]

  let state = Belt.Map.String.fromArray(stateArray)

  let result = LoginValidation.validate(state)

  let expected = state

  assertMapEqual(result, expected)
})

test("Invalidates empty required fields", () => {
  let stateArray: FormState.stateArray = [
    ("email", {value: "", error: ""}),
    ("password", {value: "123456789", error: ""}),
  ]

  let state = Belt.Map.String.fromArray(stateArray)

  let result = LoginValidation.validate(state)

  let expectedArray: FormState.stateArray = [
    ("email", {value: "", error: RequiredValidation.requiredField}),
    ("password", {value: "123456789", error: ""}),
  ]

  let expected = Belt.Map.String.fromArray(expectedArray)

  assertMapEqual(result, expected)
})

test("Invalidates too short password", () => {
  let stateArray: FormState.stateArray = [
    ("email", {value: "myemail@gmail.com", error: ""}),
    ("password", {value: "1", error: ""}),
  ]

  let state = Belt.Map.String.fromArray(stateArray)

  let result = LoginValidation.validate(state)

  let expectedArray: FormState.stateArray = [
    ("email", {value: "myemail@gmail.com", error: ""}),
    ("password", {value: "1", error: PasswordValidation.tooShortPassword}),
  ]

  let expected = Belt.Map.String.fromArray(expectedArray)

  assertMapEqual(result, expected)
})

test("Invalidates too long password", () => {
  let stateArray: FormState.stateArray = [
    ("email", {value: "myemail@gmail.com", error: ""}),
    ("password", {value: "1234567890123456789012345678901234567890", error: ""}),
  ]

  let state = Belt.Map.String.fromArray(stateArray)

  let result = LoginValidation.validate(state)

  let expectedArray: FormState.stateArray = [
    ("email", {value: "myemail@gmail.com", error: ""}),
    (
      "password",
      {
        value: "1234567890123456789012345678901234567890",
        error: PasswordValidation.tooLongPassword,
      },
    ),
  ]

  let expected = Belt.Map.String.fromArray(expectedArray)

  assertMapEqual(result, expected)
})

test("Invalidates invalid email", () => {
  let stateArray: FormState.stateArray = [
    ("email", {value: "myemail@gmail", error: ""}),
    ("password", {value: "123456789", error: ""}),
  ]

  let state = Belt.Map.String.fromArray(stateArray)

  let result = LoginValidation.validate(state)

  let expectedArray: FormState.stateArray = [
    ("email", {value: "myemail@gmail", error: EmailValidation.invalidEmail}),
    ("password", {value: "123456789", error: ""}),
  ]

  let expected = Belt.Map.String.fromArray(expectedArray)

  assertMapEqual(result, expected)
})
