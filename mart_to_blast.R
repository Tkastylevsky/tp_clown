#Se connecter à ensembl \url{http://www.ensembl.org/index.html} et cliquer dans l'onglet biomart en haut. 
#Choose database $->$ ensembl genes ; choose dataset $->$ stegastes partitus ; dans attributes (à gauche) : sequences $->$ coding sequences ; header information $->$ associated gene name; results (en haut de la page): GO. Ceci devrait pr\'epare un fichier qui s'appelle $"mart\_export.txt"$. Dans ce fichier il y a de la redondance (plusieurs s\'equences codantes par gene).

#lien de la requete:
#http://www.ensembl.org/biomart/martview/e4fd1323f89dd90ed28813a902dfefc5?VIRTUALSCHEMANAME=default&ATTRIBUTES=mmusculus_gene_ensembl.default.sequences.coding|mmusculus_gene_ensembl.default.sequences.external_gene_name|mmusculus_gene_ensembl.default.sequences.ensembl_gene_id|mmusculus_gene_ensembl.default.sequences.ensembl_transcript_id&FILTERS=&VISIBLEPANEL=attributepanel


#install.packages("seqinr")
library(seqinr)
f=read.fasta("~/shares/Evobooster/Corentin/NGS_data/data/mart_export.txt")


sequences <- sapply(f, c2s)

sequences = sequences[sequences!="sequence unavailable"]
genes <- unique(names(f))

filtered_seq <- lapply(genes, function(v) {
  
  sq=sequences[names(sequences)==v]
  
  if (length(sq) != 0) {
    lsq=sapply(1:length(sq),function (x) {
      return(unname(nchar(sq[x])))
    })
    
    return(c(v,toupper(sq[which(lsq==max(lsq))][1])))
  }
})

vector = unlist(filtered_seq)
names = vector[c(TRUE,FALSE)]
sequences = as.list(vector[c(FALSE,TRUE)])

write.fasta(sequences=sequences, names=names,  file.out="~/shares/Evobooster/Corentin/NGS_data/data/mart_mef.fa")
