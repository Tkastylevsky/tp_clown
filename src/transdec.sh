#! /bin/bash
#ce code va nous permettre de reperer les sequences codantes dans notre assemblage, cela va ensuite nous servir pour le BLAST
# launch Transdecoder
# work in 2 or 3 steps (the second is facultative)
# Step 1: extract the long open reading frames

data="/home/rstudio/disk/tp/data"
cd $data

# Create a directory where the data will be downloaded
mkdir -p Transdec_data
cd Transdec_data

cp /home/rstudio/disk/tp/data/Trinity_data/Trinity.fasta Trinity.fasta 
cp /home/rstudio/disk/tp/data/Trinity_data/Trinity.fasta.gene_trans_map Trinity.fasta.gene_trans_map 
TransDecoder.LongOrfs -S -t Trinity.fasta --gene_trans_map Trinity.fasta.gene_trans_map 
#on garde des proteines de taille minimale de 100 AA.


TransDecoder.Predict -t Trinity.fasta --single_best_only --cpu 10 
# single best only : On ne garde que le meilleur ORF detecté dans nos transcrits. 



