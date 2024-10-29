
# Proyecto de Base de Datos sobre Zonas Verdes en Medellín

Este repositorio contiene el desarrollo de una base de datos relacionada con zonas verdes en Medellín. Este proyecto universitario fue creado por los aspirantes a ingenieros:

- **Juan Pablo Restrepo Correa**
- **Andrés Felipe Jaramillo Larrañaga**
- **Diego Alejandro Carrasquilla Bravo**

## Descripción del Proyecto

Este proyecto surge a partir de un archivo de datos proporcionado por la Alcaldía de Medellín, disponible en [datos.gov.co](https://www.datos.gov.co), que contiene información relevante sobre espacios verdes en la ciudad.

### Objetivo

Nuestro objetivo principal fue organizar y estructurar estos datos en una base de datos SQL accesible y navegable, que permitirá un análisis detallado y una mejor administración de la información sobre las zonas verdes en Medellín.

### Estructura de Datos

Para lograr una identificación única de cada espacio, creamos un código de identificación propio que no existía en el archivo original. Este código tiene el formato `(XXXX-XXXX-XX)`, donde:
- **ID espacio**: identifica el espacio específico,
- **Código de barrio**: identifica el barrio al que pertenece,
- **Código de comuna**: identifica la comuna correspondiente.

## Herramientas Utilizadas

Para el desarrollo de este proyecto, utilizamos:
- **Docker** y **SQL** para manejar el servicio de bases de datos.
- **C#**, **Dart**, **Python**, y **.NET** para escribir los scripts necesarios.
- **Postman** para la generación y pruebas de solicitudes.

## Uso

Para utilizar y contribuir a este proyecto, clona el repositorio y sigue las instrucciones en los archivos de cada módulo.
