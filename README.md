
# Proyecto de Base de Datos: Zonas Verdes en Medellín

Este repositorio contiene todos los archivos y el código relacionados con la creación de una base de datos sobre las zonas verdes en Medellín. Este es un proyecto universitario realizado por:

- **Juan Pablo Restrepo Correa**
- **Andrés Felipe Jaramillo Larrañaga**
- **Diego Alejandro Carrasquilla Bravo**

## Descripción del Proyecto

La base de datos se centra en las zonas verdes de Medellín. Para obtener los datos, utilizamos un archivo proporcionado por la Alcaldía de Medellín, disponible en [Datos Abiertos Colombia](https://www.datos.gov.co).

El archivo original no incluía un código único de identificación para cada espacio, por lo que implementamos un código con el siguiente formato: `(XXXX-XXXX-XX)`, donde:

- **XXXX**: ID del espacio
- **XXXX**: Código del barrio
- **XX**: Código de la comuna

Esta identificación facilita el manejo y la organización de la información en la base de datos.

## Tecnologías Utilizadas

- **MySQL** para la creación y gestión de la base de datos.
- **Docker** para el manejo de instancias y servicios SQL, simplificando la configuración y el despliegue.

