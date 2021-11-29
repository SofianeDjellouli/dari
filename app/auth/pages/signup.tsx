import { useRouter, BlitzPage, Routes } from "blitz"
import Layout from "app/core/layouts/Layout"
import { SignupForm } from "../components/SignupForm"
import { IonContent, IonHeader, IonPage, IonTitle, IonToolbar } from "@ionic/react"
import React from "react"
import { SignupPage } from "app/auth/pages/SignupPage.gen"

/* const SignupPage: BlitzPage = () => {
  return <SignupPage />
}

SignupPage.redirectAuthenticatedTo = "/"

SignupPage.getLayout = (page) => <Layout title="Sign Up">{page}</Layout> */

export default SignupPage
