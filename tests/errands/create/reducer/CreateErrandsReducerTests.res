open Test
open Assert

test("Handles ChangeName action", () => {
  let state: CreateErrandReducer.state = {
    name: "",
    level: #Present,
    toggled: true,
  }

  let action = CreateErrandReducer.ChangeName("hi")

  let result = CreateErrandReducer.reducer(state, action)

  let expected: CreateErrandReducer.state = {
    name: "hi",
    level: #Present,
    toggled: true,
  }

  assertDeepEqual(result, expected)
})

test("Handles ChangeLevel action", () => {
  let state: CreateErrandReducer.state = {
    name: "",
    level: #Present,
    toggled: true,
  }

  let action = CreateErrandReducer.ChangeLevel(#Missing)

  let result = CreateErrandReducer.reducer(state, action)

  let expected: CreateErrandReducer.state = {
    name: "",
    level: #Missing,
    toggled: true,
  }

  assertDeepEqual(result, expected)
})

test("Handles Toggle action", () => {
  let state: CreateErrandReducer.state = {
    name: "",
    level: #Present,
    toggled: true,
  }

  let action = CreateErrandReducer.Toggle

  let result = CreateErrandReducer.reducer(state, action)

  let expected: CreateErrandReducer.state = {
    name: "",
    level: #Present,
    toggled: false,
  }

  assertDeepEqual(result, expected)
})

test("Handles Reset action", () => {
  let state: CreateErrandReducer.state = {
    name: "name",
    level: #Present,
    toggled: true,
  }

  let action = CreateErrandReducer.Reset

  let result = CreateErrandReducer.reducer(state, action)

  let expected: CreateErrandReducer.state = {
    name: "",
    level: #Present,
    toggled: false,
  }

  assertDeepEqual(result, expected)
})
