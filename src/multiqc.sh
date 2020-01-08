#!/bin/bash

#ce code permet de faire tounrer le package multiqc,qui prend en entrée les sorties de fastqc de tous nos echantillons.*
#Cela nous permet de tous les visualiser en même temps.

# Create a working directory:
data="/home/rstudio/disk/tp/data"
cd $data

# Create a directory where the data will be downloaded
mkdir -p multiqc_data

cd  /home/rstudio/disk/tp/data

multiqc fastqc_data -o /home/rstudio/disk/tp/data/multiqc_data



