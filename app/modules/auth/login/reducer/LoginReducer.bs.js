// Generated by ReScript, PLEASE EDIT WITH CARE
"use strict"

var FormState = require("../../../../core/form/state/FormState.bs.js")
var Belt_MapString = require("rescript/lib/js/belt_MapString.js")

var stateArray = [
  ["email", FormState.field],
  ["password", FormState.field],
]

var initialState = Belt_MapString.fromArray(stateArray)

function reducer(state, action) {
  if (action.TAG === /* Change */ 0) {
    return Belt_MapString.set(state, action.name, {
      value: action.value,
      error: "",
    })
  } else {
    return action._0
  }
}

exports.stateArray = stateArray
exports.initialState = initialState
exports.reducer = reducer
/* initialState Not a pure module */
