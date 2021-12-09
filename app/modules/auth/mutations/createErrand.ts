import { Ctx } from "blitz"
import db from "db"

type CreateErrand = (data: any, ctx: Ctx) => Promise<void>

const createErrand: CreateErrand = async (data, _) => {
  db.errand.create({ data })
}

export default createErrand
