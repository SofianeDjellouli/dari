// Generated by ReScript, PLEASE EDIT WITH CARE
"use strict"

var requiredField = "This field is required"

function make(param, field) {
  if (field.value.length === 0) {
    return requiredField
  } else {
    return ""
  }
}

exports.requiredField = requiredField
exports.make = make
/* No side effect */
