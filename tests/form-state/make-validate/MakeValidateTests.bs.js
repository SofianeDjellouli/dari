// Generated by ReScript, PLEASE EDIT WITH CARE
"use strict"

var Test = require("rescript-test/src/Test.bs.js")
var Curry = require("rescript/lib/js/curry.js")
var Assert = require("../../assert/Assert.bs.js")
var FormState = require("../../../app/core/form/state/FormState.bs.js")
var Belt_MapString = require("rescript/lib/js/belt_MapString.js")
var EmailValidation = require("../../../app/core/form/validations/email/EmailValidation.bs.js")
var RequiredValidation = require("../../../app/core/form/validations/required/RequiredValidation.bs.js")

Test.test("Validates form ands take order of validators in account", function (param) {
  var partial_arg = [RequiredValidation.make, EmailValidation.make]
  var validate = function (param) {
    return FormState.makeValidate(partial_arg, param)
  }
  var stateArray = [
    [
      "email",
      {
        value: "",
        error: "",
      },
    ],
  ]
  var state = Belt_MapString.fromArray(stateArray)
  var result = Curry._1(validate, state)
  var expectedArray = [
    [
      "email",
      {
        value: "",
        error: RequiredValidation.requiredField,
      },
    ],
  ]
  var expected = Belt_MapString.fromArray(expectedArray)
  return Assert.assertDeepEqual(result, expected)
})

/*  Not a pure module */
