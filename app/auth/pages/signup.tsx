import { useRouter, BlitzPage, Routes } from "blitz"
import Layout from "app/core/layouts/Layout"
import { SignupForm } from "../components/SignupForm"
import { IonContent, IonHeader, IonPage, IonTitle, IonToolbar } from "@ionic/react"
import React from "react"
import dynamic from "next/dynamic"

// TODO: use with SSR

const SignupPage_ = dynamic(
  () => import("app/auth/signup/page/SignupPage.bs").then((e) => e.make),
  { ssr: false }
)

const SignupPage: BlitzPage = () => {
  return <SignupPage_ />
}

/* SignupPage.redirectAuthenticatedTo = "/"

SignupPage.getLayout = (page) => <Layout title="Sign Up">{page}</Layout>  */

export default SignupPage
