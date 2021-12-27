import "@ionic/react/css/core.css"
import "@ionic/react/css/normalize.css"
import "@ionic/react/css/structure.css"
import "@ionic/react/css/typography.css"
import "@ionic/react/css/padding.css"
import "@ionic/react/css/flex-utils.css"
import { Snackbar } from "app/core/components/snackbar/Snackbar.gen"
import { CustomErrorBoundary } from "app/core/layouts/custom-error-boundary"
import { AppProps } from "blitz"
import React from "react"
import { RecoilRoot } from "recoil"
import { IonApp } from "@ionic/react"

// TODO: Implement this for recoil warnings: https://github.com/facebookexperimental/Recoil/issues/733#issuecomment-925072943

export default function App({ Component, pageProps }: AppProps) {
  const getLayout = Component.getLayout || ((page) => page)

  return (
    <RecoilRoot>
      <IonApp>
        <CustomErrorBoundary>
          {getLayout(<Component {...pageProps} />)}

          <Snackbar />
        </CustomErrorBoundary>
      </IonApp>
    </RecoilRoot>
  )
}
