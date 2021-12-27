import { RootErrorFallback } from "app/core/layouts/root-error-fallback"
import { ErrorBoundary, useQueryErrorResetBoundary } from "blitz"
import React, { FC } from "react"

export const CustomErrorBoundary: FC = ({ children }) => {
  const handleResetBoundary = useQueryErrorResetBoundary().reset

  return (
    <ErrorBoundary FallbackComponent={RootErrorFallback} onReset={handleResetBoundary}>
      {children}
    </ErrorBoundary>
  )
}
