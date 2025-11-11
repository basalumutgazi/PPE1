#!/usr/bin/env bash

#Q1. S'il n'y a pas "\n" à la fin de la ligne avant la dernière ligne, 
# il est possible que la dernière ligne est ignore avec "cat".
#Parce que read attends une "\n" pour continuer

# Vérification de l'argument
if [ -z "$1" ]; then
	echo "Il n'y a pas un argument donné. Arrêt du script."
	exit 1
fi

mkdir -p tableaux # pour créer une dossier s'il n'y en a pas déjà 

fichier_sortie="../tableaux/tableau-fr.html"

cat > "${fichier_sortie}" << EOF # EOF est utilisé pour écrire plusieurs lignes
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tableau des URLs</title>
</head>
<body>
    <h1>Analyse des URLs</h1>
    <table border="1">
        <tr>
            <th>Numéro</th>
            <th>URL</th>
            <th>Code HTTP</th>
            <th>Encodage</th>
            <th>Nombre de mots</th>
        </tr>
EOF

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

	echo "		<tr>" >> "${fichier_sortie}"
	echo "			<td>$num</td>" >> "${fichier_sortie}"
	echo "			<td>$ligne</td>" >> "${fichier_sortie}"
	echo "			<td>$code</td>" >> "${fichier_sortie}"
	echo "			<td>$encodage</td>" >> "${fichier_sortie}"
	echo "			<td>$n_mots</td>" >> "${fichier_sortie}"
	echo "		</tr>" >> "${fichier_sortie}"

	num=$((num+1))
done < "$1";

cat >> "${fichier_sortie}" << EOF
	</table>
</body>
</html>
EOF