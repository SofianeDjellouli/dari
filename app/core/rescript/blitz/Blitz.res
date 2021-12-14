module Ctx = {
  type t
}

type mutationStatus = [#idle | #loading | #success | #error]

module ReactQuery = {
  type useMutationResult<'data, 'error, 'variables, 'context> = {
    context: option<'context>,
    data: option<'data>,
    error: option<'error>,
    failureCount: int,
    isError: bool,
    isIdle: bool,
    isLoading: bool,
    isPaused: bool,
    isSuccess: bool,
    // mutate: UseMutateFunction<'data, 'error, 'variables, 'context>,
    // mutateAsync: UseMutateAsyncFunction<'data, 'error, 'variables, 'context>,
    reset: unit => unit,
    status: mutationStatus,
    variables: option<'variables>,
  }

  type mutationFunction<'data, 'variables> = ('variables, Ctx.t) => Promise.t<'data>

  type mutateFunction<'data, 'error, 'variables, 'context> = (. 'variables) => Promise.t<'data>

  type mutationResultPair<'data, 'error, 'variables, 'context> = (
    mutateFunction<'data, 'error, 'variables, 'context>,
    useMutationResult<'data, 'error, 'variables, 'context>,
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
    isLoading: bool,
    error: 'error,
  }

  /* type useQuery<'variables, 'result, 'error> = (
    query<'variables, 'result>,
    'variables,
  ) => ('result, queryExtras<'error>) */

  @module("next/data-client")
  external useQuery: (query<'variables, 'result>, 'variables) => ('result, queryExtras<'error>) =
    "useQuery"
}

module Link = Next.Link
