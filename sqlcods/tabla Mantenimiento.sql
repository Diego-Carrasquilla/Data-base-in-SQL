CREATE TABLE mantenimiento (
    id_unico INT NOT NULL,                     -- ID del espacio
    fecha_mantenimiento DATE NOT NULL,         -- Fecha de mantenimiento
    costo DECIMAL(10, 2) DEFAULT NULL,         -- Costo del mantenimiento (puede ser NULL para comentarios)
    tipo_usuario VARCHAR(50),                   -- Tipo de usuario que realiza la acción
    comentario VARCHAR(255) DEFAULT NULL        -- Comentario del mantenimiento
);
