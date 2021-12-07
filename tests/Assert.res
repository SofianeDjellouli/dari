open Belt
open Test

// TODO: Can we have a factory function for this?

let assertArrayEqual = (result, expected) =>
  assertion((res, exp) => Array.eq(res, exp, (a, b) => a == b), result, expected)

let assertMapEqual = (result, expected) =>
  assertion((res, exp) => Map.String.eq(res, exp, (a, b) => a == b), result, expected)

let assertDeepEqual = (result, expected) => assertion((res, exp) => res == exp, result, expected)
