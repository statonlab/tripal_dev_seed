#!/bin/bash

MRNA_FASTA =  $1
PROTEIN_FASTA =  $2
PROTEIN_REGEXP =  $3
GFF = $4
COUNT = $5
DB_DIR = $6

mkdir -p out/sequences

#Trim input files

python ../bin/minify_dataset.py \
 $COUNT $MRNA_FASTA $PROTEIN_FASTA $PROTEIN_REGEXP $GFF

#blast nucleotide against TREMBL
blastx \
-query out/sequences/mrna_mini.fasta \
-db "$DB_DIR/trembl.fasta"\
-out /out/TREMBL_$input_nuc.xml  \
-evalue 1e-5 \
-outfmt 5
#blast nucleotide against SPROT

blastx \
-query out/sequences/mrna_mini.fasta \
-db "$DB_DIR/uniprot_sprot.fasta" \
-out /out/SPROT_$input_nuc.xml  \
-evalue 1e-5 \
-outfmt 5

mkdir -p out/ips

#run IPS
interproscan.sh \
-i out/sequences/polypeptide_mini.fasta \
-f XML, tsv \
-d /out/ips/ \
--disable-precalc \
--iprlookup \
--goterms \
--pathways \
# --tempdir /TMP

#generate Biomaterials

mkdir -p out/biomaterials

python ../bin/generate_biomaterials.py


#Create false expression data
mkdir -p out/expression

python ../bin/generate_expression.py