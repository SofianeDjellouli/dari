import { AuthenticatedLayout } from "app/core/layouts/authenticated/AuthenticatedLayout.gen"
import { ErrandsLevelsList } from "app/modules/errands/levels-list/ErrandsLevelsList.gen"
import { BlitzPage, Routes } from "blitz"
import { Suspense } from "react"

const Errands: BlitzPage = () => (
  <Suspense fallback="Loading">
    <ErrandsLevelsList />
  </Suspense>
)

Errands.getLayout = (page) => <AuthenticatedLayout>{page}</AuthenticatedLayout>

Errands.authenticate = { redirectTo: Routes.Login() }

export default Errands
