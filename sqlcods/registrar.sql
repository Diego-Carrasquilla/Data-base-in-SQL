CALL registrar_usuario('nuevo_usuario@gmail.com', 'miContraseñaSegura');
CALL registrar_usuario('usuario@campusucc.edu.co', 'otraContraseñaSegura');
CALL registrar_usuario('usuario@ejemplo.com', 'contraseñaDiferente'); -- Esto lanzará un error por dominio no permitido
