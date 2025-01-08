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

//POST - LOGIN USUARIO
router.post("/login", async (req, res) => {
  const { usuario, clave } = req.body;
  const claveEncriptada = clave; // Aquí deberías encriptar la clave antes de compararla
  //NO SE ESTA ENCRIPTADO LA CLAVE POR AHORA
  const datosUsuario = await prisma.usuario.findFirst({
    where: {
      usuario: usuario,
      contrase_a: clave,
    },
  });
  console.log(datosUsuario);
  res.json(datosUsuario);
});

router.get("/", async (req, res) => {
  const usuarios = await prisma.usuario.findMany();
  res.json(usuarios);
});

export default router;
