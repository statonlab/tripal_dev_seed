[![DOI](https://zenodo.org/badge/107319541.svg)](https://zenodo.org/badge/latestdoi/107319541)
[![Documentation Status](https://readthedocs.org/projects/tripal-devseed/badge/?version=latest)](https://tripal-devseed.readthedocs.io/en/latest/?badge=latest)


The [DevSeed loader User Guide](https://tripal-devseed.readthedocs.io/en/latest) is available [here](https://tripal-devseed.readthedocs.io/en/latest)

![Tripal DevSeed logo](/docs/img/tripal_devseed.png)

Tripal DevSeed is a project for getting data loaded into Chado for your Tripal site quickly and easily.  It comes with a 200-gene dataset for Fraxinus excelsior, located in `/Fexcel_mini`.
Additionally, it includes the scripts used to download, minify, and annotate this dataset, located in `create_seed`.  Use these scripts to quickly re-create the F. excelsior dataset, or to create your own.

See the description and credits for the full dataset on [Hardwoods Genomics Project](https://hardwoodgenomics.org/organism/Fraxinus/excelsior).

# Loading Data Guide

[The full guide for loading DevSeed is available on ReadTheDocs!](https://tripal-devseed.readthedocs.io/en/latest).

# File description

## sequences

landmark (scaffold), mRNA, and protein FASTA files.  An aligned Newick format tree of the mRNA (`mrna_mini.fasta.tree`)

## gff/

Format:
`Contig0	FRAEX38873_v2	gene	16315	44054	.	+	.	ID=FRAEX38873_v2_000000010;Name=FRAEX38873_v2_000000010;biotype=protein_coding
`

## blast/

BLAST annotation of mRNA against the SWISSPROT and TrEMBL databases.

## ips/

Interproscan annotations using the protein files, in tsv and xml format.


## biomaterials/
20 biomaterials (biosamples) randomly generated with the python script `generate_biomaterials.py`.

## expression/
Expression data corresponding to the above biosamples.  Included as matrix format files.  Created with the python script `generate_expression.py`.

## kegg_annotations

KEGG annotations generated using the KEGG BLAST KOALA web tool.

## 

### Annotation Software
The DevSeed dataset was generated using the following software and versions.

* [BLAST](https://www.ncbi.nlm.nih.gov/books/NBK279690/) 2.7.1
* [InterproScan](https://www.ebi.ac.uk/interpro/download.html) 5.30-69.0
* [SWISSPROT database](https://www.uniprot.org/statistics/Swiss-Prot) June 2018
* [TREMBL database, plant subset](https://www.uniprot.org/statistics/TrEMBL) July 2018
* [KEGG Ghost KOALA](https://www.kegg.jp/ghostkoala/) 2.0
* [MAFFT](https://mafft.cbrc.jp/alignment/software/) 7.402


# License and Contributing

This project is open source and provided under the [GPL-3.0 license](https://github.com/statonlab/tripal_alchemist/blob/master/LICENSE).  It was created by Bradford Condon and Meg Staton from the University of Tennessee Knoxville.  If you would like to make a contribution, simply fork the repo and make a pull request from there.

The project "logo" is derived from the collectible card game Hearthstone, copyright © Blizzard Entertainment, Inc. Hearthstone® is a registered trademark of Blizzard Entertainment, Inc. Tripal Alchemist is not affiliated or associated with or endorsed by Hearthstone® or Blizzard Entertainment, Inc.
