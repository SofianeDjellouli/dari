import { AuthenticatedLayout } from "app/core/layouts/authenticated/AuthenticatedLayout.gen"
import { Family } from "app/modules/family/Family.gen"
import { BlitzPage, Routes } from "blitz"

const FamilyPage: BlitzPage = Family

FamilyPage.getLayout = (page) => <AuthenticatedLayout>{page}</AuthenticatedLayout>

FamilyPage.authenticate = { redirectTo: Routes.Login() }

export default FamilyPage
