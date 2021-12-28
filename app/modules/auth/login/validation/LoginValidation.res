let validate = FormState.makeValidate([
  RequiredValidation.make,
  EmailValidation.make,
  EmailValidation.make,
  PasswordValidation.make,
])
