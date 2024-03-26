"
Instrucciones metodologicas para la relizacion del trabajo de control No.1
del curso:

Teoria de las figuras planetarias y gravimetria.

Tarea No.1: Calculo de anomalias gravitacionales.
             Construccion de mapas gravimetricos.
             
1.1.- Calcule las anomalias al Aire Libre y las anomalias de Bouguer para los 
primeros 10 puntos del catalogo, cuyo valores de anomalia no estan indicados
en el catalogo. Precision del calculo 0.1mgal.

1.2.- Construya un mapa de anomalias de Bouguer y un mapa de anomalias al Aire 
Libre solo para puntos con anomalias etiquetadas.

Se utilizara como dataset, las estaciones gravimetricas de la carta topografica
E14A39
"

# Datos de entrada de la estacion gravimetrica

grados <- 35
minutos <- 40.31
altitud <- 522
gravedad_observada <- 979644.37

# Calculo de la latitud (debe estar en radianes)

latitud_decimal <- grados + (minutos / 60)
latitud <- latitud_decimal * (pi / 180)