import { LoginForm } from "app/modules/auth/login/form/LoginForm.gen"
import { BlitzPage } from "blitz"
import { UnauthenticatedLayout } from "app/core/layouts/unauthenticated/UnauthenticatedLayout.gen"

const LoginPage: BlitzPage = LoginForm

LoginPage.getLayout = (page) => (
  <UnauthenticatedLayout title="Create Account">{page}</UnauthenticatedLayout>
)

LoginPage.redirectAuthenticatedTo = "/"

LoginPage.authenticate = false

export default LoginPage
