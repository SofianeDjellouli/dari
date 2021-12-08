// Generated by ReScript, PLEASE EDIT WITH CARE
"use strict"

var Curry = require("rescript/lib/js/curry.js")
var Ionic = require("../../../core/rescript/ionic/Ionic.bs.js")
var React = require("react")
var $$Promise = require("@ryyppy/rescript-promise/src/Promise.bs.js")
var Snackbar = require("../../../core/components/snackbar/Snackbar.bs.js")
var TextField = require("../../../core/components/textfield/TextField.bs.js")
var SignupOutput = require("./SignupOutput.bs.js")
var SignupReducer = require("./SignupReducer.bs.js")
var Belt_MapString = require("rescript/lib/js/belt_MapString.js")
var SignupValidation = require("./SignupValidation.bs.js")
var DataClient = require("next/data-client")
var Signup = require("app/auth/mutations/signup").default

function SignupForm(Props) {
  var setSnackbar = Snackbar.useSnackbar(undefined)
  var match = DataClient.useMutation(Signup)
  var signupMutation = match[0]
  var match$1 = React.useReducer(SignupReducer.reducer, SignupReducer.initialState)
  var dispatch = match$1[1]
  var state = match$1[0]
  var handleSubmit = function ($$event) {
    $$event.preventDefault()
    var errors = SignupValidation.validate(state)
    if (errors.length > 0) {
      return Curry._1(dispatch, {
        TAG: /* SetErrors */ 1,
        _0: errors,
      })
    } else {
      $$Promise.$$catch(
        signupMutation(SignupOutput.getOutput(state)).then(function (num) {
          console.log(num)
          return Promise.resolve(num)
        }),
        function (rawError) {
          if (rawError.RE_EXN_ID === $$Promise.JsError) {
            var message = rawError._1.message
            if (message !== undefined) {
              Curry._1(setSnackbar, function (param) {
                return message
              })
            } else {
              Curry._1(setSnackbar, function (param) {
                return "Some unknown error"
              })
            }
          } else {
            Curry._1(setSnackbar, function (param) {
              return "Some unknown error"
            })
          }
          return Promise.reject(rawError)
        }
      )
      return
    }
  }
  var handleChange = function (e) {
    var $$event = e.target
    var value = $$event.value
    var name = $$event.name
    return Curry._1(dispatch, {
      TAG: /* Change */ 0,
      name: name,
      value: value,
    })
  }
  return React.createElement(
    Ionic.Form.make,
    {
      onSubmit: handleSubmit,
      children: null,
    },
    React.createElement(TextField.make, {
      name: "email",
      label: "Email",
      error: Belt_MapString.getWithDefault(state, "email", SignupReducer.field).error,
      value: Belt_MapString.getWithDefault(state, "email", SignupReducer.field).value,
      onChange: handleChange,
      type_: "email",
      autofocus: true,
    }),
    React.createElement(TextField.make, {
      name: "password",
      label: "Password",
      error: Belt_MapString.getWithDefault(state, "password", SignupReducer.field).error,
      value: Belt_MapString.getWithDefault(state, "password", SignupReducer.field).value,
      onChange: handleChange,
      type_: "password",
    }),
    React.createElement(Ionic.Button.AsyncButton.make, {
      color: "danger",
      expand: "block",
      label: "Submit",
      isLoading: match[1].isLoading,
    })
  )
}

var make = SignupForm

exports.make = make
/* Ionic Not a pure module */
