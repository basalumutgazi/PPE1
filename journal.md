# Journal de bord du projet encadré

## Journal de 2ème semestre
### L'exercice de classification

Je savais pas il y avait des exercices à faire à la maison. Donc, j'ai essayé de comprendre c'est qu'on doit faire. 
J'ai appris qu'on peut utiliser "*" comme une partie pas important dans le nom d'un fichier. J'ai l'aimé cette fonction beaucoup et j'ai commencé à faire l'exercise. 

```bash
mkdir txt
#créer un fichier "txt"
mv *.txt txt
#déplacer tous les fichiers en .txt à /txt
cd txt
#aller /txt
mkdir 2016 2017 2018
#créer des fichiers "2016", "2017", "2018"
#j'ai appris que mkdir peut recevoir plusieurs arguments
mv 2016_*.txt 2016
#déplacer ces qui commencent par "2016_" et est un fichier txt à /2016
cd 2016
#aller /2016
```

Ici, j'ai pensé que refaire ça pour 12 fois est nulle. Est-ce qu'il est possible de créer un loop dans le shell, je m'ai démandé. Et puis, avec un petit recherche dans le Google, j'ai trouvé que c'était possible. 

```bash
for m in {1..12}; do #créer un boucle qui va commencer avec 1 et continue jusqu'à 12 avec "m" est le variable.
    mkdir -p "$m" # si n'existe pas, créer un fichier "$m"
    mv 2017_"$m"*.txt "$m"/ # déplacer tout ce qui commence par "2017_" et avoir "$m" juste après à une fichier avec le même nom de notre variable. 
done
```

Cette solution m'a aidé beaucoup. J'ai répeté la même methode pour tout l'exercice. Lors que j'ai fini cette exercice, les profs ont fini les corrigés de la classe et on a commence à parler de `git`.

### Git
On a commencer avec les commandes git. Aussi on a créé des clés SSH. Je n'ai pas compris pourquoi c'est nécessaire mais ça a marché en premier fois pour moi. 

```shell
git clone <URL> # pour avoir une copie local d'un répo
git status # pour comparer la copie local et le répo en ligne.
git add # pour ajouter les dossiers modifiés ou créés à la modification.
git commit -m "MESSAGE" # pour créer un commit avec les modifications qu'on a fait dans local.
git push # pour envoyer les changements on a fait au dépôt sur les serveurs.
git tag [-a] [-m message] <tagname> [commit] # pour tagger le commit on a fait. 
git log # pour voir les logs
```

Après, on a finit le cours. À la semaine prochaine. 

