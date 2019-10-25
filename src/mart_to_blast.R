#Se connecter à ensembl \url{http://www.ensembl.org/index.html} et cliquer dans l'onglet biomart en haut. 
#Choose database $->$ ensembl genes ; choose dataset $->$ stegastes partitus ; dans attributes (à gauche) : sequences $->$ coding sequences ; header information $->$ associated gene name; results (en haut de la page): GO. Ceci devrait pr\'epare un fichier qui s'appelle $"mart\_export.txt"$. Dans ce fichier il y a de la redondance (plusieurs s\'equences codantes par gene).

# Ecrire un script R pour éliminer cette redondance.

#install.packages("seqinr")
library(seqinr)
f=read.fasta("mart_export.txt")

write.fasta(sequences=sequences, names=names,  file.out="mart_no_redondancy.fa")
