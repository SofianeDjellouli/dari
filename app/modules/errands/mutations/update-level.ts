import { getLevelId } from "app/modules/errands/get-level-id"
import { ErrandLevel } from "app/modules/errands/types"
import { Ctx } from "blitz"
import db from "db"

type Payload = {
  id: string
  name: ErrandLevel
}

export default async function updateErrandLevel({ id, name }: Payload, ctx: Ctx) {
  ctx.session.$authorize()

  const errandLevelId = await getLevelId(db, name)

  await db.errand.update({
    where: { id: Number(id) },
    data: { errandLevelId },
  })
}
