# MQG811
Devoirs de MQG811 

L'ensemble des travaux nécessaires pour le cours de MQG811 seront disponible ici.
Ces travaux seront réalisé à l'aide du language R et des outils Rstudio et Knit Word

Je vais décrire ici les choses que j'ai appris sur R en faisant ces devoirs.

```
Permet d'écrire du "code" dans le markdown.  

```
Il faut faire attention et ajouter 2 espace à la fin d'une ligne pour faire un \n  
*italique*  
H~2~0^6^  

Pour accéder à une ligne ou colonne d'une matrice, on peut faire m[1,] ou m[,1]   

Dataset$kitten = Dataset[["kitten"]]

Lecture de fichier : 
  read.csv("Fichier.csv")
  read.table("fichierAvecTabs.txt", sep="\t", HEADER=TRUE?)
  merge(x = "table1", y = "table2", by = c("nomTable1","nomTable2")) # Créer une join entre 2 tables selon le "by", attention agis comme un join

## Packages utiles 

gmodels - pour les tables de contingences

## Ressources intéressantes
[Pour les joins](http://stackoverflow.com/questions/1299871/how-to-join-merge-data-frames-inner-outer-left-right)
