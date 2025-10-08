#!/usr/bin/env bash

echo "argument donné : $1"

CHEMIN=${1:-.}

echo "Nombre des annotations de lieu: "
echo "2016: "
cat "$CHEMIN/2016"/* | grep Location | wc -l
echo "2017: "
cat "$CHEMIN/2017"/* | grep Location | wc -l
echo "2018: "
cat "$CHEMIN/2018"/* | grep Location | wc -l
