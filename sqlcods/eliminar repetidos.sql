ALTER TABLE espacio_publico ADD COLUMN temp_id INT AUTO_INCREMENT PRIMARY KEY;





DELETE FROM espacio_publico
WHERE temp_id NOT IN (
    SELECT * FROM (
        SELECT MIN(temp_id)
        FROM espacio_publico
        GROUP BY Id_unico
    ) AS subquery
);




ALTER TABLE espacio_publico DROP COLUMN temp_id;
