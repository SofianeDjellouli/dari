let validate = FormState.makeValidate([
  RequiredValidation.make,
  EmailValidation.make,
  PasswordValidation.make,
])
