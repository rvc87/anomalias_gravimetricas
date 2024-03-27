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

id <- c(1195, 1211, 1218, 1224, 1229, 1247, 1252, 1254, 1262)
grados <- c(35, 35, 35, 35, 35, 35, 35, 35, 35)
minutos <- c(40.31, 40.63, 40.88, 41.08, 41.26, 41.60, 41.79, 41.82, 42.14)
altitud <- c(522, 978, 833, 1033, 795, 710, 637, 614, 582)
gravedad_observada <- c(979644.37, 979552.35, 979579.72, 979540.38, 979591.90, 979602.24, 979619.52, 979624.29, 979628.49)

# Calculo de la latitud (debe estar en radianes)

latitud_decimal <- grados + (minutos / 60)
latitud <- latitud_decimal * (pi / 180)

# Calcular la gravedad normal sobre el elipsoide en la latitud de la 
# estacion gravimetrica.

a <- sin(latitud) ^ 2
b <- sin(latitud * 2 ) ^ 2
gravedad_normal_elipsoide <- 978030 * (1 + 0.005302 * a - 0.000007 * b)

# Calcular la correccion al aire libre

correccion_aire_libre <- -0.3086 * altitud

# Calculo de la gravedad normal.

gravedad_normal <- gravedad_normal_elipsoide + correccion_aire_libre

# Calculo para la correcion de la capa intermedia

correccion_capa_intermedia <- 0.0419 * 2.30 * altitud

# Calculo de la anomalia al aire libre

anomalia_aire_libre <- gravedad_observada - gravedad_normal

# Calculo de anomalia de bouguer

anomalia_bouguer <- anomalia_aire_libre - correccion_capa_intermedia







