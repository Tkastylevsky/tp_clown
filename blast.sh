#! /bin/bash
TRANSDECODERTRANSCRIPTOMES=$data"/Transdecoder_transcriptome"
REFERENCESMUSDIR=$data"/blast"

ANNOTATIONSBLAST=$data"/annotation"
TIMEFILE="$ANNOTATIONSBLAST/temps_blast.txt"



FASTAREFERENCE=$REFERENCESMUSDIR/"stegastes_partitus.mart.txt"

BLASTDBDIR=$REFERENCESMUSDIR
BLASTDB=$BLASTDBDIR/"stegastes_partitus.db"

#build reference database
makeblastdb 

#blast fasta against the ref db
blastn -db $db -query $query -evalue $evalue -outfmt 6 -out $out_blast


Rscript --vanilla  annote_fasta_from_blast.R $out_blast 


