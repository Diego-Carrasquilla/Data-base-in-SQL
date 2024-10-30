DELIMITER //

CREATE PROCEDURE registrar_usuario(IN p_nombre VARCHAR(255), IN p_correo VARCHAR(255), IN p_contraseña VARCHAR(255))
BEGIN
    DECLARE v_tipo_usuario VARCHAR(50);
    DECLARE v_existe INT;

    -- Comprobar si el correo ya está registrado
    SELECT COUNT(*) INTO v_existe
    FROM usuarios 
    WHERE correo = p_correo;

    IF v_existe > 0 THEN
        -- Si el correo ya existe, lanzar un mensaje de error
        SELECT 'El correo ya está registrado' AS mensaje;
    ELSE
        -- Asignar tipo de usuario según el dominio del correo
        IF p_correo LIKE '%@gmail.com' THEN
            SET v_tipo_usuario = 'Gmail';
        ELSEIF p_correo LIKE '%@campusucc.edu.co' THEN
            SET v_tipo_usuario = 'CampusUCC';
        ELSE
            -- Lanzar un error si el dominio no es permitido
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Dominio de correo no permitido';
        END IF;

        -- Insertar el nuevo usuario con su tipo
        INSERT INTO usuarios (nombre, correo, contraseña, tipo_usuario) 
        VALUES (p_nombre, p_correo, p_contraseña, v_tipo_usuario);

        SELECT 'Usuario registrado exitosamente' AS mensaje;
    END IF;
END //

DELIMITER ;
