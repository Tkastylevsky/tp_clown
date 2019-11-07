#!/bin/bash
  
data="/home/rstudio/disk/tp/data"
cd $data

# Create a directory where the data will be downloaded
mkdir -p Trinity_data

cd  /home/rstudio/disk/tp/data/sra_data


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



cd /home/rstudio/disk/tp/data/Trinity_data

# Remove length and path in sequence names to avoid bug with blast ( sequence name length > 1000)
sed -re "s/(>[_a-zA-Z0-9]*)( len=[0-9]*)( path=.*)/\1/" Trinity.fasta >Trinity2.fasta   
rm Trinity.fasta
mv Trinity2.fasta Trinity.fasta

perl /softwares/trinityrnaseq-Trinity-v2.8.5/util/TrinityStats.pl Trinity.fasta > stats_trinity.txt
