import { getLevelId } from "app/modules/errands/get-level-id"
import { ErrandLevel } from "app/modules/errands/types"
import { Ctx } from "blitz"
import db from "db"

type Payload = {
  name: string
  level: ErrandLevel
}

export default async function createErrand({ name, level }: Payload, ctx: Ctx) {
  ctx.session.$authorize()

  const errandLevelId = await getLevelId(db, level)

  await db.errand.create({ data: { name, errandLevelId } })

  return { name, level }
}
