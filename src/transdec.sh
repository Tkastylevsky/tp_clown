#! /bin/bash

# launch Transdecoder
# work in 2 or 3 steps (the second is facultative)
# Step 1: extract the long open reading frames

data="/home/rstudio/disk/tp/data"
cd $data

# Create a directory where the data will be downloaded
mkdir -p Transdec_data

cp /home/disk/tp/data/Trinity_data/trinity.fasta trinity.fasta
cd Transdec_data
TransDecoder.LongOrfs -t Trinity.fasta

makeblastdb -in stegastes.fa -dbtype nucl

blastn -query transdecoder_dir/longest_orfs.pep  \
    -db stegastes.fa  -max_target_seqs 1 \
    -outfmt 6 -evalue 1e-5 -num_threads 10 > blastp.outfmt6

TransDecoder.Predict -t target_transcripts.fasta --retain_blastp_hits blastp.outfmt6
