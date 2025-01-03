import { Router } from "express";
import { PrismaClient } from "@prisma/client";

const router = Router(); //para hacer las rutas de la api de forma modular
const prisma = new PrismaClient(); //abre la conexion con la base de datos

//GET USUARIO
router.get("/:id", async (req, res) => {
    const { id } = req.params;
    const usuario = await prisma.usuario.findUnique({
        where: {
            id: Number(id),
        },
    });
  res.json(usuario);
});

export default router;