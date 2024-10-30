DELIMITER //

CREATE TRIGGER before_insert_mantenimiento
BEFORE INSERT ON mantenimiento
FOR EACH ROW
BEGIN
    -- Verificar que solo los usuarios CampusUCC puedan registrar un costo
    IF NEW.tipo_usuario <> 'CampusUCC' AND NEW.costo IS NOT NULL THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Solo los usuarios CampusUCC pueden registrar un costo';
    END IF;
END //

DELIMITER ;
