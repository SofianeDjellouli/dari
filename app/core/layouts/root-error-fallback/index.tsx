import { ErrorComponent, ErrorFallbackProps } from "blitz"
import React from "react"

export function RootErrorFallback({ error }: ErrorFallbackProps) {
  return <ErrorComponent statusCode={error.statusCode || 400} title={error.message || error.name} />
}
