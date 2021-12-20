import { Ctx } from "blitz"
import db from "db"

type Payload = {
  id: string
}

export default async function deleteErrand({ id }: Payload, ctx: Ctx) {
  ctx.session.$authorize()

  await db.errand.delete({ where: { id: Number(id) } })
}
