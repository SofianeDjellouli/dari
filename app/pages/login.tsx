import { UnauthenticatedLayout } from "app/core/layouts/unauthenticated/UnauthenticatedLayout.gen"
import { LoginForm } from "app/modules/auth/login/form/LoginForm.gen"
import { BlitzPage, Routes } from "blitz"

const Login: BlitzPage = LoginForm

Login.getLayout = (page) => <UnauthenticatedLayout title="Login">{page}</UnauthenticatedLayout>

Login.redirectAuthenticatedTo = Routes.Home()

export default Login
