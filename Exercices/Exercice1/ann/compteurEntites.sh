#!/usr/bin/env bash

ANNEE=$1
ENTITE=$2

COUNT=$(cat "$ANNEE"/*.ann | grep "$ENTITE" | wc -l)
echo "Nombre de $ENTITE en $ANNEE: $COUNT"
