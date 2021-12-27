import { UnauthenticatedLayout } from "app/core/layouts/unauthenticated/UnauthenticatedLayout.gen"
import { SignupForm } from "app/modules/auth/signup/form/SignupForm.gen"
import { BlitzPage } from "blitz"

const Signup: BlitzPage = SignupForm

Signup.getLayout = (page) => (
  <UnauthenticatedLayout title="Create Account">{page}</UnauthenticatedLayout>
)

Signup.redirectAuthenticatedTo = "/"

export default Signup
