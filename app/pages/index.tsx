import { AuthenticatedLayout } from "app/core/layouts/authenticated/AuthenticatedLayout.gen"
import { UserInfo } from "app/modules/users/user-info"
import { BlitzPage, Routes } from "blitz"
import { Suspense } from "react"

const Home: BlitzPage = () => (
  <Suspense fallback="Loading...">
    <UserInfo />
  </Suspense>
)

Home.suppressFirstRenderFlicker = true

Home.getLayout = (page) => <AuthenticatedLayout>{page}</AuthenticatedLayout>

Home.authenticate = { redirectTo: Routes.Login() }

export default Home
