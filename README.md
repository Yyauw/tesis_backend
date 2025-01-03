# Tesis Backend
Repositorio del backend del proyecto de gamificacion

## Pasos para empezar
- Clonar el Repositorio y instalar las dependencias
- Crear el archivo .env en base al archivo ".example.env"

## Pasos para inicializar la base de datos
- crear una base de datos con el nombre "bd_gamificacion"
- crear un usuario con contraseña y darle permisos para leer y escribir sobre la bd
- en el archivo .env agregar ``DATABASE_URL="mysql://NOMBRE:PASSWORD@localhost:PORT/bd_gamificacion"``
- en el proyecto ejecutar los comandos ``npx prisma generate``, ``npx prisma migrate deploy``