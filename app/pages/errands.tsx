import { AuthenticatedLayout } from "app/core/layouts/authenticated/AuthenticatedLayout.gen"
import { ErrandsPage } from "app/modules/errands/page/ErrandsPage.gen"
import { BlitzPage, Routes } from "blitz"
import { Suspense } from "react"

const Errands: BlitzPage = () => (
  <Suspense fallback="Loading">
    <ErrandsPage />
  </Suspense>
)

Errands.getLayout = (page) => <AuthenticatedLayout>{page}</AuthenticatedLayout>

Errands.authenticate = { redirectTo: Routes.Login() }

export default Errands
