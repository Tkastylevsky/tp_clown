#!/bin/bash

#ce script permet de faire tounrer le package Fastqc sur les données de RNAseq que l'on vient de télécharger. 
#cela va nous permettre d'effectuer un controle de qualité

# Again go create / go in the working directory

# Create a folder for the fastqc

# Create a working directory:
data="/home/rstudio/disk/tp/data"
cd $data

# Create a directory where the data will be downloaded
mkdir -p fastqc_data

cd  /home/rstudio/disk/tp/data

# On crée une liste de nos 6 echantillons

li=`ls sra_data/*.fastq`


#la boucle for execute fastqc sur nos 6 echantillons
for i in $li
do

fastqc $i -O /home/rstudio/disk/tp/data/fastqc_data
done