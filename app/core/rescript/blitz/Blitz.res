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

  type mutationOptions<'data, 'error, 'variables, 'context> = {
    onSuccess: option<('data, 'variables, 'context) => unit>,
    onError: option<('error, 'variables, 'context) => unit>,
  }

  type mutateFunction<'data, 'error, 'variables, 'context> = (. 'variables) => Promise.t<'data>

  type mutationResultPair<'data, 'error, 'variables, 'context> = (
    mutateFunction<'data, 'error, 'variables, 'context>,
    mutationExtras<'data, 'error, 'variables, 'context>,
  )

  @module("next/data-client")
  external useMutationDefault: (
    ~function: mutationFunction<'data, 'variables>,
    ~options: mutationOptions<'data, 'error, 'variables, 'context>=?,
    unit,
  ) => mutationResultPair<'data, 'error, 'variables, 'context> = "useMutation"

  let useMutation = (
    ~function: mutationFunction<'data, 'variables>,
    ~onSuccess: option<('data, 'variables, 'context) => unit>=?,
    ~onError: option<('error, 'variables, 'context) => unit>=?,
    (),
  ): mutationResultPair<'data, 'error, 'variables, 'context> => {
    let setSnackbar = Snackbar.useSnackbar()

    let handleError = switch onError {
    | Some(_) => onError
    | None =>
      Some(
        (rawError, _, _) =>
          setSnackbar(_ =>
            switch Js.Exn.message(rawError) {
            | Some(message) => message
            | None => "An error happened"
            }
          ),
      )
    }

    useMutationDefault(~function, ~options={onError: handleError, onSuccess: onSuccess}, ())
  }

  type query<'variables, 'result> = 'variables => Promise.t<'result>

  type queryExtras<'error, 'result> = {
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
    refetch: unit => Promise.t<'result>,
  }

  @module("next/data-client")
  external useQuery: (
    query<'variables, 'result>,
    'variables,
  ) => (option<'result>, queryExtras<'error, 'result>) = "useQuery"

  @module("next/data-client")
  external usePaginatedQuery: (
    query<'variables, 'result>,
    'variables,
  ) => (option<'result>, queryExtras<'error, 'result>) = "usePaginatedQuery"

  @module("next/data-client")
  external invalidateQuery: ('resolver, 'arguments) => Promise.t<unit> = "invalidateQuery"
}

module Link = Next.Link
