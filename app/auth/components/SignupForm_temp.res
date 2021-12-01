module LoginForm = %form(
  type input = {
    email: string,
    password: string,
  }

  type output = {
    email: string,
    password: string,
  }

  let validators = {
    email: {
      strategy: OnFirstSuccessOrFirstBlur,
      validate: input =>
        switch input.email {
        | "" => Error("Email is required")
        | _ => Ok(input.email)
        },
    },
    password: {
      strategy: OnFirstBlur,
      validate: input =>
        switch input.password {
        | "" => Error("Password is required")
        | _ => Ok(input.password)
        },
    },
  }
)

@react.component
let make = () => {
  let form = LoginForm.useForm(~initialInput={email: "", password: ""}, ~onSubmit=(output, cb) => {
    Js.log2(
      output,
      cb,
    ) /* output->Api.loginUser(res =>
      switch res {
      | Ok(user) => user->AppShell.loginAndRedirect
      | Error() => cb.notifyOnFailure()
      }
    ) */
  })

  <form onSubmit={_ => form.submit()}>
    <input
      value={form.input.email}
      disabled={form.submitting}
      onBlur={_ => form.blurEmail()}
      onChange={e =>
        form.updateEmail(
          (input, value) => {...input, email: value},
          e->ReactEvent.Form.target(e)["value"],
        )}
    />
    {switch form.emailResult {
    | Some(Error(message)) => <div className="error"> {message->React.string} </div>
    | Some(Ok(_))
    | None => React.null
    }}
    <input
      value={form.input.password}
      disabled={form.submitting}
      onBlur={_ => form.blurPassword()}
      onChange={e =>
        form.updatePassword(
          (input, value) => {...input, password: value},
          e->ReactEvent.Form.target(e)["value"],
        )}
    />
    {switch form.passwordResult {
    | Some(Error(message)) => <div className="error"> {message->React.string} </div>
    | Some(Ok(_))
    | None => React.null
    }}
    <button disabled={form.submitting}> {"Submit"->React.string} </button>
    {switch form.status {
    | Editing
    | Submitting(_)
    | Submitted => React.null
    | SubmissionFailed() => <div className="error"> {"Not logged in"->React.string} </div>
    }}
  </form>
}
