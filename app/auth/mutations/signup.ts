import { Ctx, SecurePassword } from "blitz"
import db from "db"
import { Signup } from "app/auth/validations"
import { Role } from "types"

type Signup = (data: { email: string; password: string }, ctx: Ctx) => Promise<void>

const signup: Signup = async ({ email, password }, ctx) => {
  const hashedPassword = await SecurePassword.hash(password.trim())

  try {
    const user = await db.user.create({
      data: { email: email.toLowerCase().trim(), hashedPassword, role: "USER" },
      select: { id: true, name: true, email: true, role: true },
    })

    await ctx.session.$create({ userId: user.id, role: user.role as Role })
  } catch (error) {
    throw new Error(error.code === "P2002" ? "Email already used" : "Error")
  }
}

export default signup
