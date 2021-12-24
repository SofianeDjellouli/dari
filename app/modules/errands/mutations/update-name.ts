import { Ctx } from "blitz"
import db from "db"

type Payload = {
  id: string
  name: string
}

export default async function updateErrandName({ id, name }: Payload, ctx: Ctx) {
  ctx.session.$authorize()

  await db.errand.update({
    where: { id: Number(id) },
    data: { name },
  })
}
