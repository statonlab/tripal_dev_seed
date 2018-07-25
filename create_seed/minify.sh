#!/bin/bash

MRNA_FASTA=$1
PROTEIN_FASTA=$2
PROTEIN_REGEXP=$3
GFF=$4
GFF_KEY=$5
COUNT=$6

#if output directory already exists, warn user and exit.
if [ -d "out/sequences" ]; then
#echo "Error: out directory already exists.  Please rename or delete."
#exit 1
rm -rf out
fi

mkdir -p out/sequences
mkdir -p out/gff

python ../bin/minify_dataset.py \
 $COUNT $MRNA_FASTA $PROTEIN_FASTA $PROTEIN_REGEXP $GFF $GFF_KEY
