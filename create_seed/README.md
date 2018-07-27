
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

#### C sativus

```
curl ftp://ftp.ncbi.nih.gov/genomes/Cucumis_sativus/GFF/ref_ASM407v2_scaffolds.gff3.gz > src_data/C_sativus/gff.gff.gz

curl ftp://ftp.ncbi.nih.gov/genomes/Cucumis_sativus/protein/protein.fa.gz > src_data/C_sativus/prot.fasta.gz

curl ftp://ftp.ncbi.nih.gov/genomes/Cucumis_sativus/RNA/rna.fa.gz > src_data/C_sativus/mRNA.fasta.gz

gunzip src_data/C_sativus/mRNA.fasta.gz
gunzip src_data/C_sativus/prot.fasta.gz
gunzip src_data/C_sativus/gff.gff.gz

```

```
./minify.sh src_data/C_sativus/mRNA.fasta src_data/C_sativus/prot.fasta '(.*)' src_data/C_sativus/gff.gff 100 /db
```

#### Hebr

```
mkdir src_data/Hebr
curl https://treegenesdb.org/FTP/Genomes/Hebr/v1.0/annotation/Hebr.1_0.cds.fa.gz > src_data/Hebr/Hebr_1.0_mrna.fasta.gz
curl https://treegenesdb.org/FTP/Genomes/Hebr/v1.0/annotation/Hebr.1_0.gff.gz > src_data/Hebr/Hebr_1.0_gff.gff.gz
curl https://treegenesdb.org/FTP/Genomes/Hebr/v1.0/annotation/Hebr.1_0.peptides.fa.gz > src_data/Hebr/Hebr_1.0_prot.fasta.gz


gunzip src_data/Hebr/Hebr_1.0_mrna.fasta.gz
gunzip src_data/Hebr/Hebr_1.0_prot.fasta.gz
gunzip src_data/Hebr/Hebr_1.0_gff.gff.gz

TransDecoder.LongOrfs -t src_data/Hebr/Hebr_1.0_mrna.fasta
mv src_data/Hebr/Hebr_1.0_mrna.fasta.transdecoder_dir/longest_orfs.pep src_data/Hebr/Hebr_1.0_prot.fasta
```
We use transdecoder because otherwise we might not be able to get the mRNA name from the polypeptide name.
This is problematic when loading in annotations, which must be linked to the parent feature via regular expression.

```
./minify.sh  \
 src_data/Hebr/Hebr_1.0_mrna.fasta \
 src_data/Hebr/Hebr_1.0_prot.fasta\
 '(.*?)\.p'  \
  src_data/Hebr/Hebr_1.0_gff.gff\
  Name\
   200\
    /db

mv out Hebr_mini
 ```

```bash
./annotate.sh \
Hebr_mini/sequences/mrna_mini.fasta \
Hebr_mini/sequences/polypeptide_mini.fasta \
/fake/db/path \
Hebr

mv out/* Hebr_mini/
rm -r out

```



#### F excelsior

download data:

```
mkdir src_data/Fexcel
curl http://ashgenome.org/sites/default/files/annotation_v5/Fraxinus_excelsior_38873_TGAC_v2.gff3.gz > src_data/Fexcel/Fexcel.gff3.gz
curl http://ashgenome.org/sites/default/files/annotation_v5/Fraxinus_excelsior_38873_TGAC_v2.gff3.cds.fa.gz > src_data/Fexcel/Fexcelcds.fasta.gz
curl http://ashgenome.org/sites/default/files/annotation_v5/Fraxinus_excelsior_38873_TGAC_v2.gff3.pep.fa.gz > src_data/Fexcel/Fexcelaa.fasta.gz

gunzip src_data/Fexcel/Fexcel.gff3.gz
gunzip src_data/Fexcel/Fexcelcds.fasta.gz
gunzip src_data/Fexcel/Fexcelaa.fasta.gz

```

 ```bash

 ./minify.sh  \
 src_data/Fexcel/Fexcelcds.fasta \
 src_data/Fexcel/Fexcelaa.fasta\
 '(.*)'  \
  src_data/Fexcel/Fexcel.gff3\
  ID \
  200

 ```

Then run the annotation script

 ```bash
 ./annotate.sh \
out/sequences/mrna_mini.fasta \
out/sequences/polypeptide_mini.fasta \
/staton/libraries/uniprot/ \
Fexcel

mv out Fexcel_mini
```
