import db from "./index"

/*
 * This seed function is executed when you run `blitz db seed`.
 *
 * Probably you want to use a library like https://chancejs.com
 * or https://github.com/Marak/Faker.js to easily generate
 * realistic data.
 */
const seed = async () =>
  (
    [
      { level: "Present", name: "jazar" },
      { level: "Present", name: "mouz" },
      { level: "Missing", name: "dajaj" },
      { level: "Missing", name: "joubn" },
      { level: "Lacking", name: "halib" },
      { level: "Present", name: "zit" },
    ] as const
  ).forEach(async (data, i) => {
    await db.errand.create({ data })
  })

export default seed
