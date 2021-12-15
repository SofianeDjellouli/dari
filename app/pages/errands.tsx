import { AuthenticatedLayout } from "app/core/layouts/authenticated/AuthenticatedLayout.gen"
import { ErrandsList } from "app/modules/errands/list/ErrandsList.gen"
import { BlitzPage, Routes } from "blitz"
import { Suspense } from "react"

const Errands: BlitzPage = () => (
  <Suspense fallback="Loading">
    <ErrandsList />
  </Suspense>
)

Errands.getLayout = (page) => <AuthenticatedLayout>{page}</AuthenticatedLayout>

Errands.authenticate = { redirectTo: Routes.Login() }

export default Errands
