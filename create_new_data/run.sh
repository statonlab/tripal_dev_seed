#!/bin/bash

MRNA_FASTA=$1
PROTEIN_FASTA=$2
PROTEIN_REGEXP=$3
GFF=$4
GFF_KEY=$5
COUNT=$6
DB_DIR=$7

#if output directory already exists, warn user and exit.
if [ -d "out" ]; then
#echo "Error: out directory already exists.  Please rename or delete."
#exit 1
rm -rf out
fi

mkdir -p out/sequences
mkdir -p out/gff

#Trim input files

python ../bin/minify_dataset.py \
 $COUNT $MRNA_FASTA $PROTEIN_FASTA $PROTEIN_REGEXP $GFF $GFF_KEY

#blast nucleotide against TREMBL
blastx \
-query out/sequences/mrna_mini.fasta \
-db "$DB_DIR/trembl.fasta"\
-out "/out/$MRNA_FASTA.TREMBL.xml"  \
-evalue 1e-5 \
-outfmt 5
#blast nucleotide against SPROT

blastx \
-query out/sequences/mrna_mini.fasta \
-db "$DB_DIR/uniprot_sprot.fasta" \
-out "/out/$MRNA_FASTA.SPROT.xml"  \
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

python ../bin/generate_biomaterials.py 20


#Create false expression data
mkdir -p out/expression

python ../bin/generate_expression.py out/biomaterials/biomaterials.xml out/sequences/mrna_mini.fasta