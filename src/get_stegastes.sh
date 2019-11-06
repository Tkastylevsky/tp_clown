data="/home/rstudio/disk/tp/data"
cd $data

# Create a directory where the data will be downloaded
mkdir -p Transdec_data

cd /home/rstudio/disk/tp/data/Transdec_data
wget -O stegastes.fa 'http://ensembl.org/biomart/martservice?query=

<Query  virtualSchemaName = "default" formatter = "FASTA" header = "0" uniqueRows = "0" count = "" datasetConfigVersion = "0.6" >
				
	<Dataset name = "spartitus_gene_ensembl" interface = "default" >
		<Attribute name = "coding" />
		<Attribute name = "external_gene_name" />
		<Attribute name = "ensembl_gene_id" />
	</Dataset>
</Query>'