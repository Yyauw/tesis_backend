-- CreateTable
CREATE TABLE `cabeza` (
    `id_cabeza` INTEGER NOT NULL AUTO_INCREMENT,
    `cabeza` VARCHAR(100) NOT NULL,

    PRIMARY KEY (`id_cabeza`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `clase` (
    `id_clase` INTEGER NOT NULL,
    `nombre_clase` VARCHAR(100) NULL,
    `curso_id` INTEGER NULL,

    INDEX `curso_id`(`curso_id`),
    PRIMARY KEY (`id_clase`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `curso` (
    `id_curso` INTEGER NOT NULL,
    `nombre_curso` VARCHAR(100) NULL,

    PRIMARY KEY (`id_curso`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `leccion` (
    `id_leccion` INTEGER NOT NULL,
    `nombre_leccion` VARCHAR(100) NULL,
    `curso_id` INTEGER NULL,

    INDEX `curso_id`(`curso_id`),
    PRIMARY KEY (`id_leccion`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tarea` (
    `id_tarea` INTEGER NOT NULL,
    `nombre_tarea` VARCHAR(100) NULL,
    `leccion_id` INTEGER NULL,

    INDEX `leccion_id`(`leccion_id`),
    PRIMARY KEY (`id_tarea`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `torso` (
    `id_torso` INTEGER NOT NULL AUTO_INCREMENT,
    `torso` VARCHAR(100) NOT NULL,

    PRIMARY KEY (`id_torso`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `usuario` (
    `id_usuario` INTEGER NOT NULL,
    `usuario` VARCHAR(100) NULL,
    `contraseña` VARCHAR(100) NULL,
    `rol` VARCHAR(50) NULL,
    `nombre` VARCHAR(100) NULL,
    `apellido` VARCHAR(100) NULL,

    PRIMARY KEY (`id_usuario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `usuario_cabeza` (
    `id_usuario_cabeza` INTEGER NOT NULL AUTO_INCREMENT,
    `usuario_id` INTEGER NOT NULL,
    `cabeza_id` INTEGER NOT NULL,
    `equipado` BOOLEAN NOT NULL,

    INDEX `cabeza_id`(`cabeza_id`),
    INDEX `usuario_id`(`usuario_id`),
    PRIMARY KEY (`id_usuario_cabeza`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `usuario_clase` (
    `id_usuario` INTEGER NOT NULL,
    `id_clase` INTEGER NOT NULL,

    INDEX `id_clase`(`id_clase`),
    PRIMARY KEY (`id_usuario`, `id_clase`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `usuario_tarea` (
    `id_usuario` INTEGER NOT NULL,
    `id_tarea` INTEGER NOT NULL,
    `puntaje_obtenido` INTEGER NULL,

    INDEX `id_tarea`(`id_tarea`),
    PRIMARY KEY (`id_usuario`, `id_tarea`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `usuario_torso` (
    `id_usuario_torso` INTEGER NOT NULL AUTO_INCREMENT,
    `usuario_id` INTEGER NOT NULL,
    `torso_id` INTEGER NOT NULL,
    `equipado` BOOLEAN NOT NULL,

    INDEX `torso_id`(`torso_id`),
    INDEX `usuario_id`(`usuario_id`),
    PRIMARY KEY (`id_usuario_torso`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `clase` ADD CONSTRAINT `clase_ibfk_1` FOREIGN KEY (`curso_id`) REFERENCES `curso`(`id_curso`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `leccion` ADD CONSTRAINT `leccion_ibfk_1` FOREIGN KEY (`curso_id`) REFERENCES `curso`(`id_curso`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tarea` ADD CONSTRAINT `tarea_ibfk_1` FOREIGN KEY (`leccion_id`) REFERENCES `leccion`(`id_leccion`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `usuario_cabeza` ADD CONSTRAINT `usuario_cabeza_ibfk_1` FOREIGN KEY (`cabeza_id`) REFERENCES `cabeza`(`id_cabeza`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `usuario_cabeza` ADD CONSTRAINT `usuario_cabeza_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario`(`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `usuario_clase` ADD CONSTRAINT `usuario_clase_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario`(`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `usuario_clase` ADD CONSTRAINT `usuario_clase_ibfk_2` FOREIGN KEY (`id_clase`) REFERENCES `clase`(`id_clase`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `usuario_tarea` ADD CONSTRAINT `usuario_tarea_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario`(`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `usuario_tarea` ADD CONSTRAINT `usuario_tarea_ibfk_2` FOREIGN KEY (`id_tarea`) REFERENCES `tarea`(`id_tarea`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `usuario_torso` ADD CONSTRAINT `usuario_torso_ibfk_1` FOREIGN KEY (`torso_id`) REFERENCES `torso`(`id_torso`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `usuario_torso` ADD CONSTRAINT `usuario_torso_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario`(`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;

