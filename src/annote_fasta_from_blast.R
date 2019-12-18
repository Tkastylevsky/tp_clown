#!/usr/bin/env Rscript


setwd(dir = "/home/rstudio/disk/tp/data/BLASTN_data")
test = read.table("blast_stegastes" )

test[test$V2=="ENSSPAG00000013419|si:ch211-256m1.8",]





args = commandArgs(trailingOnly=TRUE)

# test if there is at least one argument: if not, return an error
BlastFile <-args[1]
Species <- args[2]
OutputFile <- args[3]
Evalue <- as.numeric(args[4])

df <- read.table(BlastFile, h=F, stringsAsFactors = F)

#Fields: query id, subject id, % identity, alignment length, mismatches, gap opens, q. start, q. end, s. start, s. end, evalue, bit score

#Create a table format :
# Spartisus	Aocellaris	evalue	Score
write.table(df.duplicate_filter, file = OutputFile, quote = F, row.names = F,sep="\t")






