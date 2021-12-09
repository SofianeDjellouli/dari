import { Ctx } from "blitz"
import db from "db"

export default async function getErrand(_: null, ctx: Ctx) {
  ctx.session.$authorize()

  const errand = await db.errand.findFirst({
    where: { id: 1 },
    select: { id: true, name: true, level: true },
  })

  return errand
}
