import { SignupForm } from "app/modules/auth/signup/form/SignupForm.gen"
import { BlitzPage } from "blitz"
import { UnauthenticatedLayout } from "app/core/layouts/unauthenticated/UnauthenticatedLayout.gen"

const SignupPage: BlitzPage = SignupForm

SignupPage.getLayout = (page) => (
  <UnauthenticatedLayout title="Create Account">{page}</UnauthenticatedLayout>
)

export default SignupPage
