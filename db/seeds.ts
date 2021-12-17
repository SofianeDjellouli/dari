import { SecurePassword } from "blitz"
import db from "./index"

/*
 * This seed function is executed when you run `blitz db seed`.
 *
 * Probably you want to use a library like https://chancejs.com
 * or https://github.com/Marak/Faker.js to easily generate
 * realistic data.
 */

const createManyErrands = (names: string[]) => ({
  errands: { create: names.map((name) => ({ name })) },
})

const errandsLevelsData = [
  { id: 1, name: "Missing", ...createManyErrands(["jazar", "mouz", "zit"]) },
  { id: 2, name: "Lacking", ...createManyErrands(["halib"]) },
  { id: 3, name: "Present", ...createManyErrands(["dajaj", "joubn"]) },
] as const

const seed = async () => {
  errandsLevelsData.forEach(async (data) => {
    await db.errandLevel.create({ data })
  })

  const hashedPassword = await SecurePassword.hash("12345678")

  await db.user.create({ data: { email: "sofiane@vaangroup.com", hashedPassword } })
}

export default seed
