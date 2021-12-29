// Generated by ReScript, PLEASE EDIT WITH CARE
"use strict"

var Blitz = require("../../../../core/rescript/blitz/Blitz.bs.js")
var Curry = require("rescript/lib/js/curry.js")
var Ionic = require("../../../../core/rescript/ionic/Ionic.bs.js")
var React = require("react")
var FormState = require("../../../../core/form/state/FormState.bs.js")
var TextField = require("../../../../core/components/textfield/TextField.bs.js")
var LoginReducer = require("../reducer/LoginReducer.bs.js")
var Belt_MapString = require("rescript/lib/js/belt_MapString.js")
var LoginValidation = require("../validation/LoginValidation.bs.js")
var Login = require("../../mutations/login").default

var login = Login

function LoginForm(Props) {
  var match = Blitz.ReactQuery.useMutation(login, undefined, undefined, undefined)
  var loginMutation = match[0]
  var match$1 = React.useReducer(FormState.reducer, LoginReducer.initialState)
  var dispatch = match$1[1]
  var state = match$1[0]
  var handleSubmit = function ($$event) {
    $$event.preventDefault()
    var validatedState = LoginValidation.validate(state)
    if (FormState.isValidForm(validatedState)) {
      return FormState.mapFieldsToMutation(state, loginMutation)
    } else {
      return Curry._1(dispatch, {
        NAME: "SetState",
        VAL: validatedState,
      })
    }
  }
  var handleChange = function (e) {
    var target = e.target
    var value = target.value
    var name = target.name
    return Curry._1(dispatch, {
      NAME: "Change",
      VAL: {
        name: name,
        value: value,
      },
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
      error: Belt_MapString.getWithDefault(state, "email", FormState.field).error,
      value: Belt_MapString.getWithDefault(state, "email", FormState.field).value,
      onChange: handleChange,
      type_: "email",
      autofocus: true,
    }),
    React.createElement(TextField.make, {
      name: "password",
      label: "Password",
      error: Belt_MapString.getWithDefault(state, "password", FormState.field).error,
      value: Belt_MapString.getWithDefault(state, "password", FormState.field).value,
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

var make = LoginForm

exports.login = login
exports.make = make
/* login Not a pure module */
