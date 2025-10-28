import type { NextApiRequest, NextApiResponse } from 'next'

type Data = {
  id: string
  name: string
  email: string
  createdAt: string
}

export default function handler(
  req: NextApiRequest,
  res: NextApiResponse<Data>
) {
  const { id } = req.query

  // Simular datos de usuario
  const user = {
    id: id as string,
    name: `Usuario ${id}`,
    email: `usuario${id}@ejemplo.com`,
    createdAt: new Date().toISOString()
  }

  res.status(200).json(user)
}
