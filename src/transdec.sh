#! /bin/bash

# launch Transdecoder
# work in 2 or 3 steps (the second is facultative)
# Step 1: extract the long open reading frames

data="/home/rstudio/disk/test2"
cd $data

# Create a directory where the data will be downloaded
mkdir -p Transdec_data

cp /home/disk/test2/Trinity_data/trinity.fasta trinity.fasta
cd Trinity_data
TransDecoder.LongOrfs -t Trinity.fasta




TransDecoder.Predict 
