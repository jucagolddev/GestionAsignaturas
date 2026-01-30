-- Script de creación de base de datos para Gestión de Asignaturas

-- 1. Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS gestion_asignaturas CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE gestion_asignaturas;

-- 2. Tabla de Asignaturas
CREATE TABLE IF NOT EXISTS asignaturas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    codigo VARCHAR(20) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- 3. Tabla de Resultados de Aprendizaje (RA)
-- Relación: Muchos RAs pertenecen a una Asignatura
CREATE TABLE IF NOT EXISTS resultados_aprendizaje (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descripcion TEXT NOT NULL,
    asignatura_id INT NOT NULL,
    FOREIGN KEY (asignatura_id) REFERENCES asignaturas(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 4. Tabla de Criterios de Evaluación
-- Relación: Muchos Criterios pertenecen a un RA
CREATE TABLE IF NOT EXISTS criterios_evaluacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descripcion TEXT NOT NULL,
    ra_id INT NOT NULL,
    FOREIGN KEY (ra_id) REFERENCES resultados_aprendizaje(id) ON DELETE CASCADE
) ENGINE=InnoDB;


