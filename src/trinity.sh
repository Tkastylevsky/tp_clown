#!/bin/bash

#Ce code nous permet d'assembler nos transcrits avec l'aide de Trinity. 

data="/home/rstudio/disk/tp/data"
cd $data

# Create a directory where the data will be downloaded
mkdir -p Trinity_data

cd  /home/rstudio/disk/tp/data/sra_data

#cette ligne permet de récupérer les noms de nos FASTQ
FASTQ=$(ls /home/rstudio/disk/tp/data/sra_data/*.fastq |paste -s -d, -)
#-s on append un element a la fois, -d permet de définir des délimiteurs de liste,
#- permet de lire l'input standard.

Trinity --normalize_by_read_set \
        --seqType fq \
        --CPU 14 \
        --max_memory 50G \ 
        --trimmomatic \
        --no_version_check \
        --SS_lib_type R \
        --single $FASTQ \
        --output /home/rstudio/disk/tp/data/Trinity_data
        
        # il faudra bien expliquer pourquoi chaque option ! 
        #dans le même ordre que les options : 
        #normalize-by-read_set : permet de normaliser afin que les transcrit présent en grande quantité ne cachent pas les transcrits peu exprimés.
        # seqType : le format de nos données
        # CPU : le nombre de CPU qu'on va utiliser pour le calcul
        #max_memory : la mémoire vive allouée à l'assemblage
        #trimmomatic : permet de trimmer nos séquences.
        #no_version-check : ne va pas chercher la dernière version disponible de Trinity en ligne.
        #SS-lib-type : Le R indique qu'on a des séquences reverse
        # indique l'emplacement de nos données single end
        #output : l'emplacement des fichiers de sortie.

cd /home/rstudio/disk/tp/data/Trinity_data

# Remove length and path in sequence names to avoid bug with blast ( sequence name length > 1000)
sed -re "s/(>[_a-zA-Z0-9]*)( len=[0-9]*)( path=.*)/\1/" Trinity.fasta >Trinity2.fasta   
rm Trinity.fasta
mv Trinity2.fasta Trinity.fasta


#permet de récupérer les statistiques de Trinity afin de controler la qualité de l'assemblage. 
perl /softwares/trinityrnaseq-Trinity-v2.8.5/util/TrinityStats.pl Trinity.fasta > stats_trinity.txt
