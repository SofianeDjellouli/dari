// Generated by ReScript, PLEASE EDIT WITH CARE
"use strict"

var Curry = require("rescript/lib/js/curry.js")
var Js_dict = require("rescript/lib/js/js_dict.js")
var Belt_Array = require("rescript/lib/js/belt_Array.js")
var Belt_MapString = require("rescript/lib/js/belt_MapString.js")

function mapFieldsToMutation(state, mutation) {
  mutation(
    Js_dict.fromArray(
      Belt_MapString.toArray(
        Belt_MapString.map(state, function (e) {
          return e.value
        })
      )
    )
  )
}

function makeValidate(errorGetters, state) {
  return Belt_MapString.mapWithKey(state, function (key, field) {
    var error = Belt_Array.reduce(errorGetters, "", function (acc, curr) {
      if (acc === "") {
        return Curry._2(curr, key, field)
      } else {
        return acc
      }
    })
    return {
      value: field.value,
      error: error,
    }
  })
}

function isValidForm(state) {
  return Belt_MapString.every(state, function (param, field) {
    return field.error === ""
  })
}

function makeReducer(next, state, action) {
  if (typeof action !== "object") {
    return Curry._2(next, state, action)
  }
  var variant = action.NAME
  if (variant === "SetState") {
    return action.VAL
  }
  if (variant !== "Change") {
    return Curry._2(next, state, action)
  }
  var match = action.VAL
  return Belt_MapString.set(state, match.name, {
    value: match.value,
    error: "",
  })
}

function identityReducer(state, param) {
  return state
}

function reducer(param, param$1) {
  return makeReducer(identityReducer, param, param$1)
}

var field = {
  value: "",
  error: "",
}

exports.field = field
exports.mapFieldsToMutation = mapFieldsToMutation
exports.makeValidate = makeValidate
exports.isValidForm = isValidForm
exports.makeReducer = makeReducer
exports.identityReducer = identityReducer
exports.reducer = reducer
/* No side effect */
