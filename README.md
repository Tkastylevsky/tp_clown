# NGS Practicals Clownfish

The aim of this study is to find the genetic determinants of the color changes between the different stripes of the clownfish. 
In this goal, we will use RNAseq data that we will assemble de novo, then we will annotate it using the bicolor damselfish genome. The final step of the analysis is to use DESeq2 in order to realise differencial gene expression analysis.

## Getting started
Since all the data necessary for this project is stored on the Ensembl server, the instructions contained in this file will suffice for you to obtain a copy of the project. 

## Project Structure

### Obtaining the Data

The first step is to download the data from the Ensembl server, for this, the SRA_download.sh will be used. It uses the Fastq_dump program in order to retrieve it. You will need to change the file directories. The code will also allow you to put the files in the good format for later use in Trinity. 

### Quality control

Quality control is realised through the packages fastqc and multiqc, in the codes which have the same respective names. You need to use the fastqc code before the multiqc. They will provide information such as per base sequence content, per base n content...

### Transcript Assembly

We will use Trinity in order to assemble our transcripts. The details of the options we chose is avaible in the code, and will also provide information on the nature of the RNA seq data that we have (single end reverse). Please make sure to allocate your file directories correctly and to check the chosen options before launching the assembly. A trial on a smaller dataset is recommended, as the assembly can take several hours depending on your setup. 
The necessary code is in trinity.sh.
Trinity provides some statistics about the realised assembly, they will be stored in stats_trinity.txt. An interesting value to look at is the median length of the reconstructed transcripts, which should be around 1.6 Kb. 

### Data Annotation

The first step of the annotation will be to use Transdecoder in order to extract the ORFs from the reconstructed transcripts. 
These ORF will then be blasted on the coding sequences of Stegastes Partitus, retrieved from Biomart. 
To obtain the results from Transdecoder, please use transdec.sh
To retrieve the genome of Stegastes Partitus with the chosen options, explained in the code, please use get_stegastes.sh. You will then need to use mart_to_blast.sh in order to eliminate redundancy in the coding sequences of Stegastes. This step is necessary before the blast.
to realise the blast, you will need to have a blast version installed on your machine. We have chosen to realise a Blastn, since our reference species is not too phylogenetically distant from the clownfish. 
Please use blast.sh in order to realise it. 

### Quantification

We will use Salmon in order to quantify the abundance of the reconstructed transcripts. This step can be realised independantly from the annotation, but please kkep in minde that in that case, you will not be able to identify individual transcripts. 
Please use salmon.sh in order to do the quantification. 
The next step is to use tximport in order to convert the obtained data into a format that can be read by DESeq2. For this, we will us Tximport. please use tximport.R for this. 

### Analysis

The final step is the analysis, that will be done with the DESEQ2.Rmd script. This will allow us to do differencial gene expression analysis using DESeq2, as well as data visualization, both at the gene level and using PCAs. 

## Acknowledgements

We would like to thank our comrades Noa Rigoudy and Heloise Muller, as this work was a common effort with them, as well as our supervisors, with special thanks to corentin Dechaud for his help and for designing the project.

