#Esperanza Ramirez Armijos.

#Leemos los datos de nuestro archivo DATOS.xlsx
Datos <- readXL("C:/Users/18-4004/Desktop/DATOS.xlsx", rownames=FALSE, header=TRUE, na="", sheet="Datos", 
  stringsAsFactors=TRUE)

#Visualizamos los datos cargados
showData(Datos, placement='-20+200', font=getRcmdr('logFont'), 
  maxwidth=80, maxheight=30)

#Matriz de Correlacion
cor(Datos[,c("ASISTENCIA.LOCAL","CAPACIDAD.DE.ESTADOS","GOLES.A.FAVOR",
  "GOLES.EN.CONTRA","PARTIDOS.EMPATADOS","PARTIDOS.GANADOS",
  "PARTIDOS.JUGADOS","PARTIDOS.PERDIDOS","POSICION.HISTORICA",
  "PUNTOS.GANADOS","TOTAL.TITULOS")], use="complete")

#Matriz de diagramas de dispercion
scatterplotMatrix(~ASISTENCIA.LOCAL+CAPACIDAD.DE.ESTADOS+GOLES.A.FAVOR+GOLES.EN.CONTRA+PARTIDOS.EMPATADOS+PARTIDOS.GANADOS+PARTIDOS.JUGADOS+PARTIDOS.PERDIDOS+POSICION.HISTORICA+PUNTOS.GANADOS+TOTAL.TITULOS,
   reg.line=lm, smooth=FALSE, spread=FALSE, span=0.5, ellipse=FALSE, levels=c(.5, .9), id.n=0, diagonal = 'density', data=Datos, main="Matriz de Disgramas de 
  Dispersión")

#Analizamos y podemos observar que existe una correlacion fuerte entre PARTIDOS GANADOS y PUNTOS GANADOS
#Con estas dos variblas realizamos un MODELO DE REGRESION LINEAL SIMPLE
Reg_Lineal_Simple <- lm(PARTIDOS.GANADOS~PUNTOS.GANADOS, data=Datos)
summary(Reg_Lineal_Simple)

#Funcion de REGRESION LINEAL SIMPLE: Y = 0.322208X -2.873543

#Verificamos si la REGRESION LINEAL es significativa (el anova me muestra una correlacion diferente de cero)
anova(Reg_Lineal_Simple)

#Intervalo de Confianza
library(MASS, pos=15)
Confint(Reg_Lineal_Simple, level=0.95)

#Grafica Basica de Diagnostico del Modelo (Residuales)
oldpar <- par(oma=c(0,0,3,0), mfrow=c(2,2))
plot(Reg_Lineal_Simple)
par(oldpar)

#Para refinar el modelo podemos eliminar el INTERSECTO
Reg_Lineal_Simple <- lm(PARTIDOS.GANADOS~PUNTOS.GANADOS-1, data=Datos)
summary(Reg_Lineal_Simple)

#Podemos observar de mejor manera mediante el DIAGRAMA DE DISPERCION
scatterplot(PARTIDOS.GANADOS~PUNTOS.GANADOS, reg.line=lm, smooth=TRUE, spread=TRUE, id.method='mahal', id.n = 5, boxplots=FALSE, span=0.5, ellipse=FALSE, 
  levels=c(.5, .9), main="Diagrama de Dispersión", data=Datos)

#Ahora, partiendo de este análisis podemos realizar nuestro Modelo De Regresión Multiple el cual nos permitirá realizar un pronostico mas acertado.
#MATRIZ DE DIAGRAMA DE DISPERCION (Partidos Ganados,   Goles a  Favor,  Puntos Ganados,  Puntos Ganados,  Goles en Contra, Partidos Perdidos)

#Ahora vamos a crear un MODELO DE REGRESION MULTIPLE
Reg_Linel_Multiple <- lm(PARTIDOS.GANADOS ~ GOLES.A.FAVOR +PUNTOS.GANADOS + GOLES.EN.CONTRA +PARTIDOS.PERDIDOS, data=Datos)
summary(Reg_Linel_Multiple)

#Funcion de REGRESION LINEAL MULTIPLE Y = 0.04628X + 0.30641X -0.08213X +0.22343X -3.62081.

# Anova
anova(Reg_Linel_Multiple)

#Para refinar el modelo podemos eliminar el INTERSECTO
Reg_Linel_Multiple <- lm(PARTIDOS.GANADOS ~ GOLES.A.FAVOR +PUNTOS.GANADOS + GOLES.EN.CONTRA +PARTIDOS.PERDIDOS -1, data=Datos)
summary(Reg_Linel_Multiple)

#Funcion de REGRESION LINEAL MULTIPLE Y = 0.04801X + 0.27131X - 0.08485X + 0.11826X.

#Intervalos de confianza
Confint(Reg_Linel_Multiple, level=0.95)

#Grafica Basica de Diagnostico del Modelo (Residuales)
oldpar <- par(oma=c(0,0,3,0), mfrow=c(2,2))
plot(Reg_Linel_Multiple)
par(oldpar)

#Finalmente podemos añadir las estadisticas basicas del modelo
Datos<- within(Datos, {
  fitted.Reg_Linel_Multiple <- fitted(Reg_Linel_Multiple)
  hatvalues.Reg_Linel_Multiple <- hatvalues(Reg_Linel_Multiple) 
})

#visualizamos los datos
showData(Datos, placement='-20+200', font=getRcmdr('logFont'), maxwidth=80, maxheight=30)
scatterplotMatrix(~GOLES.A.FAVOR+GOLES.EN.CONTRA+PARTIDOS.GANADOS+PARTIDOS.PERDIDOS+PUNTOS.GANADOS, reg.line=lm, smooth=TRUE, spread=FALSE, span=0.5, 
  ellipse=FALSE, levels=c(.5, .9), id.n=0, diagonal = 'density', data=Datos, main="Matriz de Disgramas de Dispersión")

