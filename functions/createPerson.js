const { PrismaClient, PrismaClientRequestError } = require('@prisma/client')
const prisma = new PrismaClient()

exports.handler = async (event, context, callback) => {
  try {
    const data = JSON.parse(event.body)
    const createdPerson = await prisma.person.create({ data })

    return {
      statusCode: 200,
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(createdPerson)
    }
  } catch (e) {
    if (e instanceof PrismaClientRequestError) {
      if (e.code === 'P2002') {
        return {
          statusCode: 409,
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            error: 'A person with this email already exists'
          })
        }
      }
    }

    console.error(e)
    return { statusCode: 500 }
  }
}
