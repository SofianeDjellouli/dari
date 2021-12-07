// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Belt_MapString from "rescript/lib/es6/belt_MapString.js"

function validate(state) {
  return Belt_MapString.toArray(state).reduce(function (acc, curr) {
    if (curr[1].value === "") {
      return acc.concat([
        {
          name: curr[0],
          error: "This field is required",
        },
      ])
    } else {
      return acc
    }
  }, [])
}

export { validate }
/* No side effect */
