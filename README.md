# Pronosticador_Final

Proyecto Pronosticador de Fútbol Ecuatoriano

Se implemento un algoritmo en R-Proyect de Regresión Lineal Simple y Multiple, el cual toma los datos estadísticos del
archivo DATOS.xlsx el cual me permite inicializar un vector para proceder a realizar
los calculos necesarios y mediante la Regresion Lineal poder hallar los resultados de predicción.
Se debe tener en cuenta que se tomaron como variables los siguientes datos:
Total Títulos.
Capacidad de Estadios.
Asistencia Local.
Posición Histórica.
Puntos Ganados.
Partidos Jugados.
Partidos Ganados.
Partidos Empatados.
Partidos Perdidos.
Goles a Favor.
Goles en Contra.
Se tomaron en cuenta los 12 equipos participantes de la Copa Pilsener 2016 y los últimos 10 años de participación de cada equipo.

************************************************* PASOS PARA EJECUTAR EL PROYECTO "PRONOSTICADOR" ***********************************************************
1.- Se debe copiar el archivo DATOS.xlsx (se encuentra en la carpeta INPUT) en el disco local C , en el escritorio del equipo o donde usted prefiera.
2.- Ejecutamos el programa R-PROYECT
3.- Abrirmos el archivo Pronosticador.R (se encuentra en la carpeta SOURCE)
4.- Antes de ejecutar dicho archivos modificamos la ruta de acceso, dependiendo de donde se encuentre nuestro archivo DATOS.xlsx (solo debemos
    modificar la siguiente ruta : C:/Users/18-4004/Desktop/DATOS.xlsx).
    Datos <- readXL("C:/Users/18-4004/Desktop/DATOS.xlsx", rownames=FALSE, header=TRUE, na="", sheet="Datos", stringsAsFactors=TRUE)
5.- Finalmente procedemos a ejecutar el proyecto guiandonos con los comentarios.

