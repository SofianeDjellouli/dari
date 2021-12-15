import { Ctx } from "blitz"
import db from "db"

export default async function getErrand(idCursor: number | null, ctx: Ctx) {
  ctx.session.$authorize()

  const errand = await db.errand.findMany({
    ...(idCursor && {
      cursor: { id: idCursor },
      skip: 1,
    }),
    take: 10,
    select: {
      id: true,
      name: true,
      level: true,
    },
  })

  return errand
}
