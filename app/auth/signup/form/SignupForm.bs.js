// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js"
import * as Ionic from "../../../core/rescript/ionic/Ionic.bs.js"
import * as React from "react"
import * as ReForm from "@rescriptbr/reform/src/ReForm.bs.js"
import * as $$Promise from "@ryyppy/rescript-promise/src/Promise.bs.js"
import * as TextField from "../../../core/components/textfield/TextField.bs.js"
import * as Belt_Array from "rescript/lib/es6/belt_Array.js"
import * as ReSchemaI18n from "reschema/src/ReSchemaI18n.bs.js"
import * as DataClient from "next/data-client"
import Signup from "app/auth/mutations/signup"

function get(values, field) {
  if (field) {
    return values.email
  } else {
    return values.password
  }
}

function set(values, field, value) {
  if (field) {
    return {
      password: values.password,
      email: value,
    }
  } else {
    return {
      password: value,
      email: values.email,
    }
  }
}

var Fields = {
  get: get,
  set: set,
}

var FormApi = ReForm.Make({
  set: set,
  get: get,
})

function SignupForm(Props) {
  var match = DataClient.useMutation(Signup)
  var signupMutation = match[0]
  var password = Curry._3(
    FormApi.ReSchema.Validation.custom,
    function (state) {
      var length = state.password.length
      if (length === 0) {
        return {
          TAG: /* Error */ 1,
          _0: "required",
        }
      } else if (length < 8) {
        return {
          TAG: /* Error */ 1,
          _0: "too small",
        }
      } else if (length > 11) {
        return {
          TAG: /* Error */ 1,
          _0: "too big",
        }
      } else {
        return /* Valid */ 0
      }
    },
    undefined,
    /* Password */ 0
  )
  var email = Curry._3(
    FormApi.ReSchema.Validation.custom,
    function (state) {
      var length = state.email.length
      if (length === 0) {
        return {
          TAG: /* Error */ 1,
          _0: "required",
        }
      }
      if (FormApi.ReSchema.RegExps.email.test(state.email)) {
        return /* Valid */ 0
      }
      var message = Curry._1(ReSchemaI18n.$$default.email, state.email)
      return {
        TAG: /* Error */ 1,
        _0: message,
      }
    },
    undefined,
    /* Email */ 1
  )
  var form = Curry._7(
    FormApi.use,
    {
      password: "",
      email: "",
    },
    /* Schema */ {
      _0: Belt_Array.concatMany([email, password]),
    },
    function (data) {
      $$Promise.$$catch(
        signupMutation(data.state.values).then(function (num) {
          console.log(num)
          return Promise.resolve(num)
        }),
        function (error) {
          console.log(error)
          Curry._1(data.send, /* ResetForm */ 2)
          return Promise.reject(error)
        }
      )
      console.log(1)
    },
    undefined,
    undefined,
    /* OnChange */ 0,
    undefined
  )
  var handleSubmit = function ($$event) {
    $$event.preventDefault()
    return Curry._1(form.submit, undefined)
  }
  var handleField = function (field, e) {
    var value = e.target.value
    return Curry._2(form.handleChange, field, value)
  }
  console.log(form)
  return React.createElement(
    Ionic.Form.make,
    {
      onSubmit: handleSubmit,
      children: null,
    },
    React.createElement(TextField.make, {
      name: "Email",
      label: "Email",
      error: Curry._1(
        form.getFieldError,
        /* Field */ {
          _0: /* Email */ 1,
        }
      ),
      value: form.values.email,
      onChange: function (param) {
        return handleField(/* Email */ 1, param)
      },
      type_: "email",
      autofocus: true,
    }),
    React.createElement(TextField.make, {
      name: "password",
      label: "Password",
      error: Curry._1(
        form.getFieldError,
        /* Field */ {
          _0: /* Password */ 0,
        }
      ),
      value: form.values.password,
      onChange: function (param) {
        return handleField(/* Password */ 0, param)
      },
      type_: "password",
    }),
    React.createElement(Ionic.Button.AsyncButton.make, {
      color: "danger",
      expand: "block",
      label: "Submit",
      isLoading: form.isSubmitting,
    })
  )
}

var make = SignupForm

export { Fields, FormApi, make }
/* FormApi Not a pure module */
