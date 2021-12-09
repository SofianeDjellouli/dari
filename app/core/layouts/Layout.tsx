import { Head, BlitzLayout } from "blitz"

const Layout: BlitzLayout<{ title?: string }> = ({ title, children }) => (
  <>
    <Head>
      <title>{title || "dari"}</title>

      <link rel="icon" href="/favicon.ico" />
    </Head>

    {children}
  </>
)

export default Layout
