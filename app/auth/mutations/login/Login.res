let authenticateUser = /* (rawEmail: string, rawPassword: string) */ _ =>
  Promise.make((resolve, _reject) => {
    // We use uncurried functions for resolve / reject
    // for cleaner JS output without unintended curry calls
    resolve(. "hello world")
  })
