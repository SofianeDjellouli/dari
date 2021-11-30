import { useRouter, BlitzPage, Routes } from "blitz"
import Layout from "app/core/layouts/Layout"
import { SignupForm } from "../components/SignupForm"
import { IonContent, IonHeader, IonPage, IonTitle, IonToolbar } from "@ionic/react"
import React from "react"
import { make as SignupPage } from "app/auth/pages/SignupPage.bs"

/* const SignupPage: BlitzPage = () => {
  return <SignupPage />
}

SignupPage.redirectAuthenticatedTo = "/"

SignupPage.getLayout = (page) => <Layout title="Sign Up">{page}</Layout> */

export default SignupPage
