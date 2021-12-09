import { Ctx, SecurePassword } from "blitz"
import db from "db"
import { Signup } from "app/auth/validations"
import { Role } from "types"
import sendGrid from "@sendgrid/mail"
import { EMAIL_SENDER } from "app/core/email/constants"

sendGrid.setApiKey(process.env.SENDGRID_KEY as string)

type Signup = (data: { email: string; password: string }, ctx: Ctx) => Promise<void>

const signup: Signup = async ({ email, password }, ctx) => {
  try {
    const hashedPassword = await SecurePassword.hash(password.trim())

    const formattedEmail = email.toLowerCase().trim()

    const user = await db.user.create({
      data: { email: formattedEmail, hashedPassword, role: "USER" },
      select: { id: true, name: true, email: true, role: true },
    })

    /*  await sendGrid.send({
      to: formattedEmail,
      from: EMAIL_SENDER,
      subject: "Dari - Email Verification",
      text: "Welcome to Dari",
      html: `<div>
      <h1>Welcome to Dari</h1>
      <a href="${""}">Verify</a>
      </div>`,
    }) */

    await ctx.session.$create({ userId: user.id, role: user.role as Role })
  } catch (error) {
    throw new Error(error.code === "P2002" ? "Email already used" : "Error")
  }
}

export default signup
