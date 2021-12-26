import { ErrandLevel } from "app/modules/errands/types"
import database from "db"

type GetLevelId = (db: typeof database, level: ErrandLevel) => Promise<number | undefined>

export const getLevelId: GetLevelId = async (db, level) => {
  const errandsLevels = await db.errandLevel.findMany()

  const errandLevelId = errandsLevels.find((e) => e.name === level)?.id

  return errandLevelId
}
