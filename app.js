import express from "express";
import usuarioRouter from "./routes/app/usuario";

const app = express();
const port = process.env.PORT || 3000;
//MIDDLEWARES
app.use(express.json()); //para aceptar peticiones formato json
app.use(express.urlencoded({ extended: true })); //para aceptar peticiones con datos de formulario

//ROUTER
app.use("/usuario", usuarioRouter);// Toda las rutas de usuarioRouter van a ser accesibles desde /usuario

//ROUTES
app.get("/", (req, res) => {
    res.send("Bienvenido al api de tesis");
  });
  
  app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
  });