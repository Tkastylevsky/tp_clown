#ce code permet de récuper les séquences codantes de stegastes pour faire le BLAST.

data="/home/rstudio/disk/tp/data"
cd $data

# Create a directory where the data will be downloaded
mkdir -p BLASTN_data

cd /home/rstudio/disk/tp/data/BLASTN_data
wget -O stegastes.fa 'http://ensembl.org/biomart/martservice?query=

<Query  virtualSchemaName = "default" formatter = "FASTA" header = "0" uniqueRows = "0" count = "" datasetConfigVersion = "0.6" >
				
	<Dataset name = "spartitus_gene_ensembl" interface = "default" >
		<Attribute name = "coding" />
		<Attribute name = "ensembl_gene_id" />
		<Attribute name = "external_gene_name" />
	</Dataset>
</Query>'

#coding : récupère les sequences codantes
#ensemble-gene-id : l'identifiant ensembl
#external gene name : nom d'usage du gène

