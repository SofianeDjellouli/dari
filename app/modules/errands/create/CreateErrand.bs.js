// Generated by ReScript, PLEASE EDIT WITH CARE
"use strict"

var Curry = require("rescript/lib/js/curry.js")
var Ionic = require("../../../core/rescript/ionic/Ionic.bs.js")
var React = require("react")
var Snackbar = require("../../../core/components/snackbar/Snackbar.bs.js")
var React$1 = require("@ionic/react")
var CreateErrandItem = require("./item/CreateErrandItem.bs.js")
var DataClient = require("next/data-client")
var Create = require("../mutations/create").default
var CreateErrandReducer = require("./reducer/CreateErrandReducer.bs.js")

var createErrand = Create

function CreateErrand(Props) {
  var setSnackbar = Snackbar.useSnackbar(undefined)
  var match = DataClient.useMutation(createErrand, undefined)
  var createErrandMutation = match[0]
  var match$1 = React.useReducer(CreateErrandReducer.reducer, CreateErrandReducer.initialState)
  var dispatch = match$1[1]
  var state = match$1[0]
  var handleToggle = function (param) {
    return Curry._1(dispatch, /* Toggle */ 0)
  }
  var handleReset = function (param) {
    return Curry._1(dispatch, /* Reset */ 1)
  }
  var handleSubmit = function (e) {
    e.preventDefault()
    createErrandMutation(state).then(function (errand) {
      Curry._1(dispatch, /* Reset */ 1)
      Curry._1(setSnackbar, function (param) {
        return errand.level + " " + errand.name + " added"
      })
      return Promise.resolve(undefined)
    })
  }
  if (state.toggled) {
    return React.createElement(
      Ionic.Form.make,
      {
        onSubmit: handleSubmit,
        children: null,
      },
      React.createElement(CreateErrandItem.make, {
        dispatch: dispatch,
        state: state,
      }),
      React.createElement(React$1.IonToolbar, {
        children: React.createElement(
          React$1.IonButtons,
          {
            children: null,
          },
          React.createElement(React$1.IonButton, {
            children: "Cancel",
            onClick: handleReset,
          }),
          React.createElement(Ionic.Button.AsyncButton.make, {
            color: "danger",
            label: "Confirm",
            isLoading: match[1].isLoading,
          })
        ),
      })
    )
  } else {
    return React.createElement(React$1.IonButton, {
      children: "Add Errand",
      onClick: handleToggle,
    })
  }
}

var make = CreateErrand

exports.createErrand = createErrand
exports.make = make
/* createErrand Not a pure module */
