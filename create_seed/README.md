
# Goal:

To fully automate and document the creation of a devseed dataset.

## Quick instructions

* Download a GFF, mrna/CDS, and polypeptide FASTA
* Ensure that a regular expression can convert the polypeptide names to the the mRNA names
* Ensure that the mRNA names can be found in the GFF without a regular expression.
* Run the annotation pipeline
* Manually annotate KEGG terms (Standalone software is not available due to the proprietary nature of KEGG)

## Requirements

* python
* biopython
* BLAST
* Interproscan
* The Uniprot TREMBL and SPROT databases
* MAFFT


## Example usage script

### Data acquisition and setup


#### *F. excelsior*

*[Fraxinus excelsior](https://www.hardwoodgenomics.org/organism/Fraxinus/excelsior)*, or the common ash tree, is a tree loaded on the HardwoodGenomics Tripal site.


download data:

```
mkdir -p src_data/Fexcel
curl http://ashgenome.org/sites/default/files/annotation_v5/Fraxinus_excelsior_38873_TGAC_v2.gff3.gz > src_data/Fexcel/Fexcel.gff3.gz
curl http://ashgenome.org/sites/default/files/annotation_v5/Fraxinus_excelsior_38873_TGAC_v2.gff3.cds.fa.gz > src_data/Fexcel/Fexcelcds.fasta.gz
curl http://ashgenome.org/sites/default/files/annotation_v5/Fraxinus_excelsior_38873_TGAC_v2.gff3.pep.fa.gz > src_data/Fexcel/Fexcelaa.fasta.gz

gunzip src_data/Fexcel/Fexcel.gff3.gz
gunzip src_data/Fexcel/Fexcelcds.fasta.gz
gunzip src_data/Fexcel/Fexcelaa.fasta.gz

```
```bash
 ./minify.sh \
 200  \
 src_data/Fexcel/Fexcelcds.fasta \
 src_data/Fexcel/Fexcelaa.fasta\
  '(.*)' \
  src_data/Fexcel/Fexcel.gff3\
   ID
 ```
Arguments, in order, are:

- Number of sequences to use.
- mRNA FASTA file.
- protein FASTA file.
- REGEXP to link protein to mRNA.
- GFF file.
- tag that will link mRNA in GFF to the mRNA names in the FASTA.

Then run the annotation script

 ```bash

 ./annotate.sh \
out/sequences/mrna_mini.fasta \
out/sequences/polypeptide_mini.fasta \
/staton/libraries/uniprot/ \
Fexcel

mv out Fexcel_mini
```
