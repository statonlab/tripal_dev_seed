#!/bin/bash

  # Usage info
  # show_help() {
  # cat << EOF
  #  Usage: ${0##*/} [-h] [-f OUTFILE] [FILE]...
  #  Do stuff with FILE and write the result to standard output. With no FILE
  #  or when FILE is -, read standard input.
   
  #     -h          display this help and exit
  #      -m 		 mRNA FASTA file  
  #      -p 		 protein FASTA file

  #  EOF
  #  }





MINI_MRNA_FASTA=$1
MINI_PROTEIN_FASTA=$2
DB_DIR=$3
PREFIX=$4

if [ -d "out/ips" ]; then
rm -rf out/ips
fi
if [ -d "out/blast" ]; then
rm -rf out/blast
fi

#blast nucleotide against TREMBL
blastx \
-query $MINI_MRNA_FASTA \
-db "$DB_DIR/trembl.fasta"\
-out out/blast/$PREFIX.TREMBL.xml  \
-evalue 1e-5 \
-outfmt 5
#blast nucleotide against SPROT

blastx \
-query $MINI_MRNA_FASTA \
-db "$DB_DIR/uniprot_sprot.fasta" \
-out out/$PREFIX.SPROT.xml  \
-evalue 1e-5 \
-outfmt 5

mkdir -p out/ips

#run IPS
interproscan.sh \
-i $MINI_PROTEIN_FASTA \
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

python ../bin/generate_expression.py out/biomaterials/biomaterials.xml $MINI_MRNA_FASTA

#create tree
mkdir -p out/tree

mafft --retree 0 --treeout --quiet --clustalout $MINI_MRNA_FASTA > $MINI_MRNA_FASTA.clustal
mv $MINI_MRNA_FASTA.tree out/tree
