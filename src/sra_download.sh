#!/bin/bash

# Create a working directory:
data="/home/rstudio/disk/tp/data"
mkdir -p $data #crée un dossier data la ou on va travailler
cd $data

# Create a directory where the data will be downloaded
mkdir -p sra_data
cd sra_data

# Make a list of SRR accessions:
SRR="SRR7591064	
SRR7591067
SRR7591065
SRR7591066
SRR7591068
SRR7591069
"

# For each SRR accession, download the data :
for i in $SRR  #le dollar permet de rentrer dans le contenu de la variable
do
fastq-dump $i # télécharge les séquences

# Rename sequence names, trinity need that their name ends with "/1".

awk  '{ if (NR%2 == 1 ) {gsub("\\.","_");print $1"/1"}  else  { print $0}}' $i".fastq" >  $i"_.fastq"   


#regarde une ligne sur deux (celle avec les noms), puis localise l'endroit avec 
#un point (les deux barres font que le point est concidéré comme caractère) 
#et le remplace par un underscore et rajoute un antislash 1. (pour que trinity sache que c'est du single end
# et qu'il y ai pas de point parce que trinity aime pas.)


rm $i".fastq" 
mv $i"_.fastq" $i".fastq"

#renomme les fichiers
done

