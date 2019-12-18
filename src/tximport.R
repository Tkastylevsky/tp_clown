library("tximport")
library("readr")
dir <- "/home/rstudio/disk/tp/data/salmon_data"
samples <- read.table(file.path(dir,"samples.txt"), header=TRUE)



files <- file.path(dir, paste(samples$SRR,".fastq", sep =""), "quant.sf")
names(files) <- samples$SRR

tx2gene=read.table(file = "/home/rstudio/disk/tp/data/Trinity_data/Trinity.fasta.gene_trans_map")
tx2gene=data.frame(tx2gene$V2,tx2gene$V1)
txi.salmon <- tximport(files, type = "salmon", tx2gene = tx2gene)
write.csv(txi.salmon$counts, file="/home/rstudio/disk/tp/data/DESEQ_data/countTable1.csv")
