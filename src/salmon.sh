## Run salmon

data="/home/rstudio/disk/tp/data"
cd $data

# Create a directory where the data will be downloaded
mkdir -p salmon_data
cd salmon_data
cp /home/rstudio/disk/tp/data/Trinity_data/Trinity.fasta Trinity.fasta 
mkdir -p clown_index

FASTQ=$(ls /home/rstudio/disk/tp/data/sra_data/*.fastq)
# Index the transcriptome
salmon index -t Trinity.fasta -k 31 -i clown_index         #moi je garde la taille des k-mer de base.

for i in $FASTQ
do 

base=`basename $i`   # les ` ` permettent de récupérer le résultat d'une fonction et de le mettre dans la variable d'interet. 
# Quantification
salmon quant -l SR -i clown_index -r $i  -p 14 --gcBias -o "/home/rstudio/disk/tp/data/salmon_data/"$base

#-l : format des données
#-i index
# -r emplacement des fichiers
#-p nombre de threads
#gcbiais 

done



