#!/bin/bash

# Again go create / go in the working directory

# Create a folder for the fastqc

# Create a working directory:
data="/home/rstudio/disk/tp/data"
cd $data

# Create a directory where the data will be downloaded
mkdir -p fastqc_data

cd  /home/rstudio/disk/tp/data
# Pour chaque fastq 

li=`ls sra_data/*.fastq`

for i in $li
do
echo $i 

fastqc $i -O /home/rstudio/disk/tp/data/fastqc_data
done