module.exports = {
  extends: ["blitz"],
  ignorePatterns: ["*.bs.js", "*.gen.tsx"],
  rules: {
    "react/jsx-newline": ["error", { prevent: false }],
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
