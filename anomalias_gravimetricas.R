install.packages("tidyverse")
library(tidyverse)

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

# Importar data frame

## Se agregan estaciones de la red geodesia horizntal de INEGI

horizontal <- read_csv("horizontal/horizontal.csv")

## Se agregan estaciones de la red geodesia gravimetrica de INEGI

gravimetrica <- read_csv("gravimetrica/gravimetrica.csv", locale=locale(encoding="latin1"))

# Calculo de la latitud (debe estar en radianes)

latitud <- function(grados, minutos){
  latitud_decimal <- grados + (minutos / 60)
  lat <- latitud_decimal * (pi / 180)
  return(lat)
}

# Calcular la gravedad normal sobre el elipsoide en la latitud de la 
# estacion gravimetrica. 

gravedad_normal_elipsoide <- function(lat){
  a <- sin(lat) ^ 2
  b <- sin(lat * 2 ) ^ 2
  grav_normal_elipsoide <- 978030 * (1 + 0.005302 * a - 0.000007 * b)
  return(grav_normal_elipsoide)
}

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
