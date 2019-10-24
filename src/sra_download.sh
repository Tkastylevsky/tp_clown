#!/bin/bash

# Create a working directory:
data="/mnt/data/Aoce"
mkdir -p $data
cd $data

# Create a directory where the data will be downloaded
mkdir -p sra_data
cd sra_data

# Make a list of SRR accessions:
SRR="SRRXXXXXX
SRRXXXXXXX
SRRXXXXXXX
SRRXXXXXXX
SRRXXXXXXX
SRRXXXXXXX
"

# For each SRR accession, download the data :
for ... in ...
do

fastq-dump -h

# Rename sequence names, trinity need that their name ends with "/1".

awk  '{ if (NR%2 == 1 ) {gsub("\\.","_");print $1"/1"}  else  { print $0}}' 

done

