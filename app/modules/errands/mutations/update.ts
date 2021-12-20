import { Ctx } from "blitz"
import db from "db"

type Payload = {
  id: string
  name: "Present" | "Missing" | "Lacking"
}

export default async function updateErrand({ id, name }: Payload, ctx: Ctx) {
  ctx.session.$authorize()

  const errandsLevels = await db.errandLevel.findMany()

  const errandLevelId = errandsLevels.find((e) => e.name === name)?.id

  await db.errand.update({
    where: { id: Number(id) },
    data: { errandLevelId },
  })
}
