import {
  AppProps,
  ErrorBoundary,
  ErrorComponent,
  AuthenticationError,
  AuthorizationError,
  ErrorFallbackProps,
  useQueryErrorResetBoundary,
  Link,
} from "blitz"
import LoginForm from "app/modules/auth/components/LoginForm"
import { IonApp } from "@ionic/react"
import "@ionic/react/css/core.css"
import "@ionic/react/css/normalize.css"
import "@ionic/react/css/structure.css"
import "@ionic/react/css/typography.css"
import "@ionic/react/css/padding.css"
import "@ionic/react/css/flex-utils.css"
import React from "react"
import { RecoilRoot } from "recoil"
import { make as Snackbar } from "app/core/components/snackbar/Snackbar.bs"

// TODO: Implement this for recoil warnings: https://github.com/facebookexperimental/Recoil/issues/733#issuecomment-925072943

export default function App({ Component, pageProps }: AppProps) {
  const getLayout = Component.getLayout || ((page) => page)

  return (
    <RecoilRoot>
      <IonApp>
        <Link href="/projects">
          <a>{"projects"}</a>
        </Link>

        <Link href="/login">
          <a>{"login"}</a>
        </Link>

        <Link href="/signup">
          <a>{"signup"}</a>
        </Link>

        <Link href="/">
          <a>{"home"}</a>
        </Link>

        <ErrorBoundary
          FallbackComponent={RootErrorFallback}
          onReset={useQueryErrorResetBoundary().reset}
        >
          {getLayout(<Component {...pageProps} />)}

          <Snackbar />
        </ErrorBoundary>
      </IonApp>
    </RecoilRoot>
  )
}

function RootErrorFallback({ error, resetErrorBoundary }: ErrorFallbackProps) {
  if (error instanceof AuthenticationError) {
    return <LoginForm onSuccess={resetErrorBoundary} />
  } else if (error instanceof AuthorizationError) {
    return (
      <ErrorComponent
        statusCode={error.statusCode}
        title="Sorry, you are not authorized to access this"
      />
    )
  } else {
    return (
      <ErrorComponent statusCode={error.statusCode || 400} title={error.message || error.name} />
    )
  }
}
