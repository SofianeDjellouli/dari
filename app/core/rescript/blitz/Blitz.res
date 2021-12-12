module Ctx = {
  type t
}

type mutationStatus = [#idle | #loading | #success | #error]

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

module ReactQuery = {
  type mutationFunction<'data, 'variables> = ('variables, Ctx.t) => Promise.t<'data>

  type mutateFunction<'data, 'error, 'variables, 'context> = (. 'variables) => Promise.t<'data>

  type mutationResultPair<'data, 'error, 'variables, 'context> = (
    mutateFunction<'data, 'error, 'variables, 'context>,
    useMutationResult<'data, 'error, 'variables, 'context>,
  )

  type useMutation<'data, 'error, 'variables, 'context> = mutationFunction<
    'data,
    'variables,
  > => mutationResultPair<'data, 'error, 'variables, 'context>

  @module("next/data-client")
  external useMutation: mutationFunction<'data, 'variables> => mutationResultPair<
    'data,
    'error,
    'variables,
    'context,
  > = "useMutation"
}

module Link = Next.Link
