module Ctx = {
  type t
}

module ReactQuery = {
  type status = [#idle | #loading | #success | #error]

  type mutationExtras<'data, 'error, 'variables, 'context> = {
    context: option<'context>,
    data: option<'data>,
    error: option<'error>,
    failureCount: int,
    isError: bool,
    isIdle: bool,
    isLoading: bool,
    isPaused: bool,
    isSuccess: bool,
    reset: unit => unit,
    status: status,
    variables: option<'variables>,
  }

  type mutationFunction<'data, 'variables> = 'variables => Promise.t<'data>

  type mutateFunction<'data, 'error, 'variables, 'context> = (. 'variables) => Promise.t<'data>

  type mutationResultPair<'data, 'error, 'variables, 'context> = (
    mutateFunction<'data, 'error, 'variables, 'context>,
    mutationExtras<'data, 'error, 'variables, 'context>,
  )

  @module("next/data-client")
  external useMutation: mutationFunction<'data, 'variables> => mutationResultPair<
    'data,
    'error,
    'variables,
    'context,
  > = "useMutation"

  type query<'variables, 'result> = 'variables => Promise.t<'result>

  type queryExtras<'error> = {
    isError: bool,
    isFetched: bool,
    isFetchedAfterMount: bool,
    isFetching: bool,
    isIdle: bool,
    isLoading: bool,
    isLoadingError: bool,
    isPlaceholderData: bool,
    isPreviousData: bool,
    isRefetchError: bool,
    isStale: bool,
    isSuccess: bool,
    enabled: bool,
    retryOnMount: bool,
    dataUpdatedAt: int,
    errorUpdatedAt: int,
    failureCount: int,
    remove: unit => unit,
    setQueryData: unit => unit,
    reset: unit => unit,
    error: option<'error>,
    status: status,
  }

  @module("next/data-client")
  external useQuery: (
    query<'variables, 'result>,
    'variables,
  ) => (option<'result>, queryExtras<'error>) = "useQuery"

  @module("next/data-client")
  external usePaginatedQuery: (
    query<'variables, 'result>,
    'variables,
  ) => (option<'result>, queryExtras<'error>) = "usePaginatedQuery"
}

module Link = Next.Link
