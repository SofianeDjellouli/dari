import { Ctx, SecurePassword } from "blitz"
import db from "db"
import { Signup } from "app/auth/validations"
import { Role } from "types"
import sendGrid from "@sendgrid/mail"

sendGrid.setApiKey(process.env.SENDGRID_KEY as string)

const msg = {
  to: "test@example.com",
  from: "test@example.com",
  subject: "Sending with SendGrid is Fun",
  text: "and easy to do anywhere, even with Node.js",
  html: "<strong>and easy to do anywhere, even with Node.js</strong>",
}

type Signup = (data: { email: string; password: string }, ctx: Ctx) => Promise<void>

const signup: Signup = async ({ email, password }, ctx) => {
  const hashedPassword = await SecurePassword.hash(password.trim())

  try {
    const user = await db.user.create({
      data: { email: email.toLowerCase().trim(), hashedPassword, role: "USER" },
      select: { id: true, name: true, email: true, role: true },
    })

    await sendGrid.send(msg)

    await ctx.session.$create({ userId: user.id, role: user.role as Role })
  } catch (error) {
    throw new Error(error.code === "P2002" ? "Email already used" : "Error")
  }
}

export default signup
