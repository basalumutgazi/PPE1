#!/usr/bin/env bash

ANNEE=$1
MOIS=$2
NOMBRE=$3

cat $ANNEE/*$MOIS*.ann \
| grep Location \
| cut -d ' ' -f5- \
| sort \
| uniq -c \
| sort -nr \
| head -n $NOMBRE \
> classmentLieux${ANNEE}${MOIS}.txt

echo "Classment des $NOMBRE lieux les plus cités en $ANNEE/$MOIS enregistré dans classmentLieux${ANNEE}${MOIS}.txt"

