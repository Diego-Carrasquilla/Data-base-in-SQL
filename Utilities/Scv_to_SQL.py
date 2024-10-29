
import pandas as pd

def csv_to_sql(csv_file, table_name, database_name):
    """
    Convierte un archivo CSV a sentencias SQL para crear una tabla y poblarla.
    """
    print(f"Intentando leer el archivo: {csv_file}")
    
    try:
        # Leer el archivo CSV
        df = pd.read_csv(csv_file, sep=';')  # Cambia el separador según tu archivo
        print(f"CSV leído correctamente. Columnas encontradas: {list(df.columns)}")
        
        # Crear la sentencia USE DATABASE
        sql = f"USE {database_name};\n\n"
        
        # Añadir DROP TABLE IF EXISTS
        sql += f"DROP TABLE IF EXISTS `{table_name}`;\n\n"
        
        # Crear la sentencia CREATE TABLE
        columns = []
        for col in df.columns:
            if pd.api.types.is_integer_dtype(df[col]):
                sql_type = 'INT'
            elif pd.api.types.is_float_dtype(df[col]):
                sql_type = 'FLOAT'
            else:
                max_length = df[col].str.len().max() if df[col].dtype == 'object' else 255
                sql_type = f'VARCHAR({max(max_length + 50, 255)})'
            clean_col = col.strip().replace(' ', '_').replace('-', '_')
            columns.append(f"`{clean_col}` {sql_type}")
        
        create_table = f"CREATE TABLE `{table_name}` (\n"
        create_table += ",\n  ".join(columns)
        create_table += "\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;\n\n"
        
        sql += create_table
        
        # Crear las sentencias INSERT
        print("Generando INSERTs...")
        
        # Insertar en bloques de 100 registros
        batch_size = 100
        for i in range(0, len(df), batch_size):
            batch = df.iloc[i:i+batch_size]
            values_list = []
            
            for _, row in batch.iterrows():
                values = []
                for val in row:
                    if pd.isna(val):
                        values.append('NULL')
                    elif isinstance(val, str):
                        values.append(f"'{val.replace("'", "''")}'")
                    else:
                        values.append(str(val))
                values_list.append(f"({', '.join(values)})")
            
            insert = f"INSERT INTO `{table_name}` (`{'`, `'.join([col.strip().replace(' ', '_').replace('-', '_') for col in df.columns])}`) VALUES\n"
            insert += ",\n".join(values_list) + ";\n"
            sql += insert
        
        print("SQL generado correctamente")
        return sql
        
    except Exception as e:
        print(f"Error: {str(e)}")
        return None

# Rutas y nombres
ruta_csv = r'C:\Users\USER\Downloads\espacio_publico_organizado_cleaned.csv'
ruta_sql = r'C:\Users\USER\Desktop\resultado.sql'
nombre_base_datos = 'zonas_verdes'
nombre_tabla = 'espacio_publico'

try:
    # Generar SQL
    sql = csv_to_sql(ruta_csv, nombre_tabla, nombre_base_datos)
    
    if sql:
        # Guardar el archivo
        with open(ruta_sql, 'w', encoding='utf-8') as f:
            f.write(sql)
        print(f"\nArchivo SQL guardado en: {ruta_sql}")
        
except Exception as e:
    print(f"Error: {str(e)}")

input("\nPresiona Enter para cerrar...")
