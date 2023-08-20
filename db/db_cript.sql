-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema golden_road
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema golden_road
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `golden_road` DEFAULT CHARACTER SET utf8mb4 ;
USE `golden_road` ;

-- -----------------------------------------------------
-- Table `golden_road`.`area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `golden_road`.`area` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `CECO` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `unique_field` (`nombre` ASC, `CECO` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `golden_road`.`estado_sede`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `golden_road`.`estado_sede` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `unique_field` (`estado` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `golden_road`.`ubicacion_sede`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `golden_road`.`ubicacion_sede` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(105) NULL DEFAULT NULL,
  `direccion` VARCHAR(145) NULL DEFAULT NULL,
  `ciudad` VARCHAR(45) NULL DEFAULT NULL,
  `provincia` VARCHAR(45) NULL DEFAULT NULL,
  `departamento` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `golden_road`.`sede`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `golden_road`.`sede` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(145) NULL DEFAULT NULL,
  `ubicacion_sede_id` INT(11) NOT NULL,
  `estado_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_sede_estado_sede1_idx` (`estado_id` ASC) VISIBLE,
  INDEX `fk_sede_ubicacion_sede1` (`ubicacion_sede_id` ASC) VISIBLE,
  CONSTRAINT `fk_sede_estado_sede1`
    FOREIGN KEY (`estado_id`)
    REFERENCES `golden_road`.`estado_sede` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sede_ubicacion_sede1`
    FOREIGN KEY (`ubicacion_sede_id`)
    REFERENCES `golden_road`.`ubicacion_sede` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `golden_road`.`area_has_sede`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `golden_road`.`area_has_sede` (
  `sede_id` INT(11) NOT NULL,
  `area_id` INT(11) NOT NULL,
  PRIMARY KEY (`sede_id`, `area_id`),
  INDEX `fk_area_has_sede_area1_idx` (`area_id` ASC) VISIBLE,
  CONSTRAINT `fk_area_has_sede_area1`
    FOREIGN KEY (`area_id`)
    REFERENCES `golden_road`.`area` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_area_has_sede_sede1`
    FOREIGN KEY (`sede_id`)
    REFERENCES `golden_road`.`sede` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `golden_road`.`estado_equipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `golden_road`.`estado_equipo` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(40) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `unique_field` (`estado` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 33
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `golden_road`.`hardware_modelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `golden_road`.`hardware_modelo` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `bandejas` VARCHAR(45) NULL DEFAULT NULL,
  `conectividad` VARCHAR(45) NULL DEFAULT NULL,
  `procesador` VARCHAR(45) NULL DEFAULT NULL,
  `disco` VARCHAR(45) NULL DEFAULT NULL,
  `memoria` VARCHAR(45) NULL DEFAULT NULL,
  `impresion_velocidad` VARCHAR(45) NULL DEFAULT NULL,
  `impresion_resolucion` VARCHAR(45) NULL DEFAULT NULL,
  `scaner_tipo` VARCHAR(45) NULL DEFAULT NULL,
  `scaner_resolucion` VARCHAR(45) NULL DEFAULT NULL,
  `scaner_velocidad` VARCHAR(45) NULL DEFAULT NULL,
  `copia_velocidad` VARCHAR(45) NULL DEFAULT NULL,
  `copia_resolucion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `golden_road`.`tipo_modelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `golden_road`.`tipo_modelo` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(180) NULL DEFAULT NULL,
  `color` VARCHAR(180) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `unique_field` (`nombre` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 50
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `golden_road`.`modelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `golden_road`.`modelo` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `tipo_modelo_id` INT(11) NOT NULL,
  `hardware_modelo_id` INT(11) NOT NULL,
  `codigo_modelo` VARCHAR(45) NULL DEFAULT NULL,
  `nombre_modelo` VARCHAR(45) NULL DEFAULT NULL,
  `volumen_mensual_minimo` VARCHAR(45) NULL DEFAULT NULL,
  `volumen_mensual_maximo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_modelo_tipo_modelo1_idx` (`tipo_modelo_id` ASC) VISIBLE,
  INDEX `fk_modelo_hardware_modelo1_idx` (`hardware_modelo_id` ASC) VISIBLE,
  CONSTRAINT `FKl3evbwqemxekmyf5fjrqktck5`
    FOREIGN KEY (`hardware_modelo_id`)
    REFERENCES `golden_road`.`hardware_modelo` (`id`),
  CONSTRAINT `FKt57l7ni91i3f6yen9lnly3p4g`
    FOREIGN KEY (`tipo_modelo_id`)
    REFERENCES `golden_road`.`tipo_modelo` (`id`),
  CONSTRAINT `fk_modelo_hardware_modelo1`
    FOREIGN KEY (`hardware_modelo_id`)
    REFERENCES `golden_road`.`hardware_modelo` (`id`),
  CONSTRAINT `fk_modelo_tipo_modelo1`
    FOREIGN KEY (`tipo_modelo_id`)
    REFERENCES `golden_road`.`tipo_modelo` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `golden_road`.`contrato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `golden_road`.`contrato` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `fecha_inicio` DATE NULL DEFAULT NULL,
  `fecha_fin` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `golden_road`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `golden_road`.`cliente` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `razon_social` VARCHAR(45) NULL DEFAULT NULL,
  `ruc` VARCHAR(45) NULL DEFAULT NULL,
  `contrato_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cliente_contrato1_idx` (`contrato_id` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_contrato1`
    FOREIGN KEY (`contrato_id`)
    REFERENCES `golden_road`.`contrato` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `golden_road`.`equipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `golden_road`.`equipo` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `serie` VARCHAR(180) NULL DEFAULT NULL,
  `modelo_id` INT(11) NOT NULL,
  `estado_id` INT(11) NOT NULL,
  `sede_id` INT(11) NOT NULL,
  `area_id` INT(11) NOT NULL,
  `cliente_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_equipo_modelo1_idx` (`modelo_id` ASC) VISIBLE,
  INDEX `fk_equipo_estado_equipo1_idx` (`estado_id` ASC) VISIBLE,
  INDEX `fk_equipo_area_has_sede1_idx` (`sede_id` ASC, `area_id` ASC) VISIBLE,
  INDEX `fk_equipo_cliente1_idx` (`cliente_id` ASC) VISIBLE,
  CONSTRAINT `FKigwtdv9j49tjf7m7n6u7dti21`
    FOREIGN KEY (`estado_id`)
    REFERENCES `golden_road`.`estado_equipo` (`id`),
  CONSTRAINT `FKs34t8bth98a41f99sw4oyylh8`
    FOREIGN KEY (`modelo_id`)
    REFERENCES `golden_road`.`modelo` (`id`),
  CONSTRAINT `fk_equipo_area_has_sede1`
    FOREIGN KEY (`sede_id` , `area_id`)
    REFERENCES `golden_road`.`area_has_sede` (`sede_id` , `area_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipo_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `golden_road`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipo_estado_equipo1`
    FOREIGN KEY (`estado_id`)
    REFERENCES `golden_road`.`estado_equipo` (`id`),
  CONSTRAINT `fk_equipo_modelo1`
    FOREIGN KEY (`modelo_id`)
    REFERENCES `golden_road`.`modelo` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `golden_road`.`estado_caso_tecnico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `golden_road`.`estado_caso_tecnico` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `unique_field` (`nombre` ASC) VISIBLE)
ENGINE = MyISAM
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `golden_road`.`caso_tecnico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `golden_road`.`caso_tecnico` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `equipo_id` INT(11) NOT NULL,
  `codigo` VARCHAR(45) NULL DEFAULT NULL,
  `estado` VARCHAR(45) NULL DEFAULT NULL,
  `tipo` VARCHAR(45) NULL DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `estado_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_caso_tecnico_equipo1_idx` (`equipo_id` ASC) VISIBLE,
  INDEX `fk_caso_tecnico_estado_caso_tecnico1_idx` (`estado_id` ASC) VISIBLE,
  CONSTRAINT `FKh63dbjvf9lvrfppmhuphq5gpe`
    FOREIGN KEY (`equipo_id`)
    REFERENCES `golden_road`.`equipo` (`id`),
  CONSTRAINT `fk_caso_tecnico_equipo1`
    FOREIGN KEY (`equipo_id`)
    REFERENCES `golden_road`.`equipo` (`id`),
  CONSTRAINT `fk_caso_tecnico_estado_caso_tecnico1`
    FOREIGN KEY (`estado_id`)
    REFERENCES `golden_road`.`estado_caso_tecnico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `golden_road`.`estado_proveedor_servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `golden_road`.`estado_proveedor_servicio` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `unique_field` (`estado` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `golden_road`.`proveedor_servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `golden_road`.`proveedor_servicio` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `estado_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_proveedor_servicio_estado_proveedor_servicio1_idx` (`estado_id` ASC) VISIBLE,
  CONSTRAINT `fk_proveedor_servicio_estado_proveedor_servicio1`
    FOREIGN KEY (`estado_id`)
    REFERENCES `golden_road`.`estado_proveedor_servicio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `golden_road`.`tecnico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `golden_road`.`tecnico` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `celular` VARCHAR(45) NULL DEFAULT NULL,
  `proveedor_servicio_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tecnico_proveedor_servicio1` (`proveedor_servicio_id` ASC) VISIBLE,
  CONSTRAINT `fk_tecnico_proveedor_servicio1`
    FOREIGN KEY (`proveedor_servicio_id`)
    REFERENCES `golden_road`.`proveedor_servicio` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `golden_road`.`operador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `golden_road`.`operador` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `celular` VARCHAR(45) NULL DEFAULT NULL,
  `correo` VARCHAR(45) NULL DEFAULT NULL,
  `proveedor_servicio_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_operador_proveedor_servicio1_idx` (`proveedor_servicio_id` ASC) VISIBLE,
  CONSTRAINT `fk_operador_proveedor_servicio1`
    FOREIGN KEY (`proveedor_servicio_id`)
    REFERENCES `golden_road`.`proveedor_servicio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `golden_road`.`estado_visita_tecnica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `golden_road`.`estado_visita_tecnica` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `unique_field` (`estado` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `golden_road`.`visita_tecnica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `golden_road`.`visita_tecnica` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `caso_tecnico_id` INT(11) NOT NULL,
  `estado_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_visita_tecnica_caso_tecnico1_idx` (`caso_tecnico_id` ASC) VISIBLE,
  INDEX `fk_visita_tecnica_estado_visita_tecnica1_idx` (`estado_id` ASC) VISIBLE,
  CONSTRAINT `FKeelxqh6s1ubbeuglc290evf5o`
    FOREIGN KEY (`caso_tecnico_id`)
    REFERENCES `golden_road`.`caso_tecnico` (`id`),
  CONSTRAINT `fk_visita_tecnica_caso_tecnico1`
    FOREIGN KEY (`caso_tecnico_id`)
    REFERENCES `golden_road`.`caso_tecnico` (`id`),
  CONSTRAINT `fk_visita_tecnica_estado_visita_tecnica1`
    FOREIGN KEY (`estado_id`)
    REFERENCES `golden_road`.`estado_visita_tecnica` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `golden_road`.`estado_detalle_visita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `golden_road`.`estado_detalle_visita` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `unique_field` (`estado` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `golden_road`.`detalle_visita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `golden_road`.`detalle_visita` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `tecnico_id` INT(11) NOT NULL,
  `operador_id` INT(11) NOT NULL,
  `visita_tecnica_id` INT(11) NOT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `hora` TIME NULL DEFAULT NULL,
  `estado_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_detalle_visita_tecnico1_idx` (`tecnico_id` ASC) VISIBLE,
  INDEX `fk_detalle_visita_operador1_idx` (`operador_id` ASC) VISIBLE,
  INDEX `fk_detalle_visita_visita_tecnica1_idx` (`visita_tecnica_id` ASC) VISIBLE,
  INDEX `fk_detalle_visita_estado_detalle_visita1_idx` (`estado_id` ASC) VISIBLE,
  CONSTRAINT `FK1xwrflx7vpd6ox26nr4v62b45`
    FOREIGN KEY (`tecnico_id`)
    REFERENCES `golden_road`.`tecnico` (`id`),
  CONSTRAINT `FKptao9mmh58sffxdqgcdhgco81`
    FOREIGN KEY (`operador_id`)
    REFERENCES `golden_road`.`operador` (`id`),
  CONSTRAINT `FKsiwkxqdovpr0bw43m7819q872`
    FOREIGN KEY (`visita_tecnica_id`)
    REFERENCES `golden_road`.`visita_tecnica` (`id`),
  CONSTRAINT `fk_detalle_visita_estado_detalle_visita1`
    FOREIGN KEY (`estado_id`)
    REFERENCES `golden_road`.`estado_detalle_visita` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_visita_operador1`
    FOREIGN KEY (`operador_id`)
    REFERENCES `golden_road`.`operador` (`id`),
  CONSTRAINT `fk_detalle_visita_tecnico1`
    FOREIGN KEY (`tecnico_id`)
    REFERENCES `golden_road`.`tecnico` (`id`),
  CONSTRAINT `fk_detalle_visita_visita_tecnica1`
    FOREIGN KEY (`visita_tecnica_id`)
    REFERENCES `golden_road`.`visita_tecnica` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `golden_road`.`estado_suministro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `golden_road`.`estado_suministro` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `unique_field` (`estado` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `golden_road`.`tipo_suministro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `golden_road`.`tipo_suministro` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(180) NULL DEFAULT NULL,
  `Color` VARCHAR(180) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 45
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `golden_road`.`suministro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `golden_road`.`suministro` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `tipo_suministro_id` INT(11) NOT NULL,
  `capacidad` VARCHAR(180) NULL DEFAULT NULL,
  `descripcion` VARCHAR(180) NULL DEFAULT NULL,
  `modelo` VARCHAR(45) NULL DEFAULT NULL,
  `estado_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_suministro_tipo_suministro_idx` (`tipo_suministro_id` ASC) VISIBLE,
  INDEX `fk_suministro_estado_suministro1_idx` (`estado_id` ASC) VISIBLE,
  CONSTRAINT `FKhwg0cusxqvwpd4y6ggeum8ah5`
    FOREIGN KEY (`tipo_suministro_id`)
    REFERENCES `golden_road`.`tipo_suministro` (`id`),
  CONSTRAINT `fk_suministro_estado_suministro1`
    FOREIGN KEY (`estado_id`)
    REFERENCES `golden_road`.`estado_suministro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_suministro_tipo_suministro`
    FOREIGN KEY (`tipo_suministro_id`)
    REFERENCES `golden_road`.`tipo_suministro` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `golden_road`.`modelo_suministro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `golden_road`.`modelo_suministro` (
  `suministro_id` INT(11) NOT NULL AUTO_INCREMENT,
  `modelo_id` INT(11) NOT NULL,
  PRIMARY KEY (`suministro_id`, `modelo_id`),
  INDEX `fk_modelo_suministro_modelo1_idx` (`modelo_id` ASC) VISIBLE,
  CONSTRAINT `FK22xppc6xx58o1lsknmiwpdhcj`
    FOREIGN KEY (`suministro_id`)
    REFERENCES `golden_road`.`suministro` (`id`),
  CONSTRAINT `FKi031frcnpcqhsrp3umhycyx6u`
    FOREIGN KEY (`modelo_id`)
    REFERENCES `golden_road`.`modelo` (`id`),
  CONSTRAINT `fk_modelo_suministro_modelo1`
    FOREIGN KEY (`modelo_id`)
    REFERENCES `golden_road`.`modelo` (`id`),
  CONSTRAINT `fk_modelo_suministro_suministro1`
    FOREIGN KEY (`suministro_id`)
    REFERENCES `golden_road`.`suministro` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
