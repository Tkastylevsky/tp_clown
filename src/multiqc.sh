#!/bin/bash

# Create a working directory:
data="/home/rstudio/disk/tp/data"
cd $data

# Create a directory where the data will be downloaded
mkdir -p multiqc_data

cd  /home/rstudio/disk/tp/data

multiqc fastqc_data -o /home/rstudio/disk/tp/data/multiqc_data



