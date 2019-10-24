#!/bin/bash
  


FASTQ=$(ls $XXX/XXX/*.fastq |paste -s -d, -)

Trinity -h

# Remove length and path in sequence names to avoid bug with blast ( sequence name length > 1000)
sed -re "s/(>[_a-zA-Z0-9]*)( len=[0-9]*)( path=.*)/\1/"


