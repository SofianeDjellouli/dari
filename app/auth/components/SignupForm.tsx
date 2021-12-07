import { Routes, useMutation, useRouter } from "blitz"
import { Form, FORM_ERROR } from "app/core/components/Form"
import signup from "app/auth/mutations/signup"
import { Signup } from "app/auth/validations"
import { FC } from "react"

export const SignupForm: FC = () => {
  const [signupMutation] = useMutation(signup)

  const router = useRouter()

  const handleSubmit = async (values) => {
    try {
      await signupMutation(values)

      router.push(Routes.Home())
    } catch (error: any) {
      if (error.code === "P2002" && error.meta?.target?.includes("email")) {
        // This error comes from Prisma
        return { email: "This email is already being used" }
      } else {
        return { [FORM_ERROR]: error.toString() }
      }
    }
  }

  return (
    <Form
      submitText="Create Account"
      schema={Signup}
      initialValues={{ email: "", password: "" }}
      onSubmit={handleSubmit}
    ></Form>
  )
}

export default SignupForm
