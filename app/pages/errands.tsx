import { AuthenticatedLayout } from "app/core/layouts/authenticated/AuthenticatedLayout.gen"
import { ErrandsList } from "app/modules/errands/list/ErrandsList.gen"
import { BlitzPage, Routes } from "blitz"

const Errands: BlitzPage = ErrandsList

Errands.getLayout = (page) => <AuthenticatedLayout>{page}</AuthenticatedLayout>

Errands.authenticate = { redirectTo: Routes.Login() }

export default Errands
