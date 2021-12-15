import { useCurrentUser } from "app/core/hooks/useCurrentUser"
import logout from "app/modules/auth/mutations/logout"
import { Link, Routes, useMutation } from "blitz"

/*
 * This file is just for a pleasant getting started page for your new app.
 * You can delete everything in here and start from scratch if you like.
 */

export const UserInfo = () => {
  const currentUser = useCurrentUser()

  const [logoutMutation] = useMutation(logout)

  if (currentUser) {
    return (
      <>
        <button
          className="button small"
          onClick={async () => {
            await logoutMutation()
          }}
        >
          Logout
        </button>

        <div>
          {" User id: "}

          <code>{currentUser.id}</code>

          <br />

          {"User role: "}

          <code>{currentUser.role}</code>
        </div>
      </>
    )
  } else {
    return (
      <>
        <Link href={Routes.Signup()}>
          <a className="button small">
            <strong>Sign Up</strong>
          </a>
        </Link>

        <Link href={Routes.Login()}>
          <a className="button small">
            <strong>Login</strong>
          </a>
        </Link>
      </>
    )
  }
}
