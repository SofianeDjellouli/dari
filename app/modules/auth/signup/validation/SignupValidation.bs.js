// Generated by ReScript, PLEASE EDIT WITH CARE
"use strict"

var Validations = require("../../../../core/validations/Validations.bs.js")
var Belt_MapString = require("rescript/lib/js/belt_MapString.js")

function setError(name, error) {
  return [
    {
      name: name,
      error: error,
    },
  ]
}

var tooShortPassword = "Password must be at least 8 characters"

var tooLongPassword = "Password must be less than 32 characters"

var invalidEmail = "Please enter a valid email address"

var requiredField = "This field is required"

function validate(state) {
  return Belt_MapString.toArray(state).reduce(function (acc, curr) {
    var val = curr[1]
    var key = curr[0]
    var addError = function (error) {
      return acc.concat([
        {
          name: key,
          error: error,
        },
      ])
    }
    var length = val.value.length
    if (length === 0) {
      return addError(requiredField)
    } else if (key === "password") {
      if (length < 8) {
        return addError(tooShortPassword)
      } else if (length > 32) {
        return addError(tooLongPassword)
      } else {
        return acc
      }
    } else if (key === "email" && !Validations.testEmail(val.value)) {
      return addError(invalidEmail)
    } else {
      return acc
    }
  }, [])
}

exports.setError = setError
exports.tooShortPassword = tooShortPassword
exports.tooLongPassword = tooLongPassword
exports.invalidEmail = invalidEmail
exports.requiredField = requiredField
exports.validate = validate
/* Validations Not a pure module */
