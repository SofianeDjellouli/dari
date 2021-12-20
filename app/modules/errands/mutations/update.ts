import { Ctx } from "blitz"
import db from "db"

type Payload = { id: number } & (
  | {
      name: string
    }
  | {
      level: "Present" | "Missing" | "Lacking"
    }
)

export default async function updateErrand({ id, ...data }: Payload, ctx: Ctx) {
  ctx.session.$authorize()

  /*   const errand = await db.errand.update({
    where: { id },
    data,
  }) */

  // return errand
}
