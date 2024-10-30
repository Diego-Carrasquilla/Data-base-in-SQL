CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(255) UNIQUE,
    tipo_usuario ENUM('Gmail', 'CampusUCC') NOT NULL,
    contraseña VARCHAR(255) NOT NULL
);
