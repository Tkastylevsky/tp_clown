cd /home/rstudio/disk/tp/data/transdec_data
wget -O stegastes.fa 'http://ensembl.org/biomart/martservice?query=

<Query  virtualSchemaName = "default" formatter = "FASTA" header = "0" uniqueRows = "0" count = "" datasetConfigVersion = "0.6" >
				
	<Dataset name = "spartitus_gene_ensembl" interface = "default" >
		<Attribute name = "coding" />
		<Attribute name = "external_gene_name" />
		<Attribute name = "ensembl_gene_id" />
	</Dataset>
</Query>'