// Generated by ReScript, PLEASE EDIT WITH CARE
"use strict"

var Js_dict = require("rescript/lib/js/js_dict.js")
var Belt_MapString = require("rescript/lib/js/belt_MapString.js")

function mapFieldsToDict(state) {
  return Js_dict.fromArray(
    Belt_MapString.toArray(
      Belt_MapString.map(state, function (e) {
        return e.value
      })
    )
  )
}

var field = {
  value: "",
  error: "",
}

exports.field = field
exports.mapFieldsToDict = mapFieldsToDict
/* No side effect */
