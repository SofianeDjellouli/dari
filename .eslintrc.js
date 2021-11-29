module.exports = {
  extends: ["blitz"],
  rules: {
    "padding-line-between-statements": [
      "error",
      {
        blankLine: "always",
        next: "*",
        prev: "*",
      },
      {
        blankLine: "never",
        next: "import",
        prev: "*",
      },
      {
        blankLine: "any",
        next: ["case", "export"],
        prev: ["case", "export"],
      },
    ],
  },
}
