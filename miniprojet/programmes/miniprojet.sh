#!/usr/bin/env bash

#Q1. S'il n'y a pas "\n" à la fin de la ligne avant la dernière ligne, 
# il est possible que la dernière ligne est ignore avec "cat".
#Parce que read attends une "\n" pour continuer

# Vérification de l'argument
if [ -z "$1" ]; then
	echo "Il n'y a pas un argument donné. Arrêt du script."
	exit 1
fi

num=1
while read -r ligne; do
	code=$(curl -s -o /dev/null -w "%{http_code}" -L "$ligne")
	encodage=$(curl -sI "$ligne" | grep -i "Content-Type" | grep -o "charset=.*" | cut -d= -f2 | tr -d '\r')
	n_mots=$(curl -s "$ligne" | wc -w)
	if [ -z "$encodage" ]; then
		encodage="Pas d'encodage trouvé"
	fi

	if [ "$n_mots" -eq 0 ]; then
		n_mots="Pas de mots dans la page donnée"
	fi

	echo -e "${num}\t${ligne}\t${code}\t${encodage}\t${n_mots}" >> ../tableaux/tableau-fr.tsv
	num=$((num+1))
done < "$1";
