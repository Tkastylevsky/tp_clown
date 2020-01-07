#! /bin/bash
data="/home/rstudio/disk/tp/data"
cd $data
cd BLASTN_data
#build reference database


makeblastdb -in stegastes_clean2.fa -dbtype nucl -parse_seqids -out stegastes


#in : ce qu'on lui donne à manger
#dbtype : si c'est acides aminés ou nucléotides
# parse_seqids : garder les ids qui sont dans le fasta. 
# out : nom des fichiers de sortie. 

/home/rstudio/disk/tp/data/salmon_data/Trinity.fasta

#blast fasta against the ref db
blastn -db stegastes -query /home/rstudio/disk/tp/data/salmon_data/Trinity.fasta -evalue 1e-10 -outfmt 6 -out blast_stegastes



Rscript --vanilla  annote_fasta_from_blast.R $out_blast 
grep ">" stegastes_clean2.fa | sort | uniq -c | sort -nr | less




#PATH="$PATH:/softwares/ncbi-blast-2.9.0+/bin"
