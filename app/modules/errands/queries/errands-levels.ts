import { Ctx } from "blitz"
import db from "db"

export default async function getErrandsLevels(_: null, ctx: Ctx) {
  ctx.session.$authorize()

  const errandLevelsResult = await db.errandLevel.findMany({
    select: {
      id: true,
      name: true,
      errands: {
        select: {
          id: true,
          name: true,
          ErrandLevel: {
            select: {
              name: true,
            },
          },
        },
        orderBy: {
          updatedAt: "desc",
        },
      },
    },
    orderBy: {
      id: "asc",
    },
  })

  const errandLevels = errandLevelsResult.map((e) => ({
    ...e,
    errands: e.errands.map((er) => ({
      ...er,
      level: er.ErrandLevel?.name,
    })),
  }))

  return errandLevels
}
