[![DOI](https://zenodo.org/badge/107319541.svg)](https://zenodo.org/badge/latestdoi/107319541)


![Tripal DevSeed logo](/tripal_devseed.png)

Tripal DevSeed is a project for getting data loaded into Chado for your Tripal site quickly and easily.  It comes with a 200-gene dataset for Fraxinus excelsior, located in `/Fexcel_mini`.
Additionally, it includes the scripts used to download, minify, and annotate this dataset, located in `create_seed`.  These scripts call programs written in `/bin`.  Use these scripts to quickly re-create the F. excelsior dataset, or to create your own.

See the description and credits for the full dataset on [Hardwoods Genomics Project](https://hardwoodgenomics.org/organism/Fraxinus/excelsior).
# Files
## sequences/
* mrna_mini.fasta - 200 CDS sequences
* polypeptide_mini.fasta - predicted amino acids/polypeptides
* empty_landmarks.fasta - an empty FASTA file with landmark features (scaffolds) required for the GFF file.
* mrna_mini.fasta.tree - MAFFT generated tree for CDS sequences.
* clustal_mrna.clustal - clustal aligned sequences (created for tree).

## gff/

* filtered.gff - GFF3 file for just the landmarks containing the above 200 CDS.
Format:
`Contig0	FRAEX38873_v2	gene	16315	44054	.	+	.	ID=FRAEX38873_v2_000000010;Name=FRAEX38873_v2_000000010;biotype=protein_coding
`

## blast/
* Fexcel.SPROT.xml - swissprot annotations for these mRNA
* Fexcelsior.TREMBL.xml - TREMBL annotations for these mRNA

## interproscan/
* .xml - interproscan annotations for the predicted amino acids.

## biosamples/
20 biomaterials randomly generated with the python script `generate_biomaterials.py`.

## expression/
Expression data corresponding to the above biosamples.  Included as matrix format files.  Created with the python script `generate_expression.py`.

## kegg_annotations

KEGG annotations generated using the KEGG BLAST KOALA web tool.

## documentation

A series of md files that will guide you through loading all the included data in this repository (described above) into Chado using Tripal.

## database_backups

Backup databases are available with most of this data loaded.  The current database 12-19-17 is a first stab at this.


# Quick Set Up: Automatic
Tripal DevSeed is supported by [Tripal TestSuite's database seeders](https://github.com/statonlab/TripalTestSuite#database-seeders).  A default seeder is provided that will load in the files hosted on this repo.  To use it, uncomment the import statements for the data you would like to include, and run `./vendor/bin/tripaltest db:seed DevSeed`.

# Quick Set Up: Manual

* Create an organism for _Fraxinus excelsior_ (common name: European Ash)
* Create analyses to associate the data with.  We currently suggest 1 analysis per content item.
* Use the FASTA loader to load in the CDS first, then the polypeptides.
* Use the `tripal_analysis_blast` blast XML loader to load the _F. excelsior data_.  This gets associated with the mRNA.
* Publish the mRNA.
* Use the `tripal_analyssi_interpro` to load the interproscan data.
* Publish the proteins.
* Load Biosamples/Biomaterials.
* Load Expression data for Biosamples.

Note that to load the polypeptides, you must link them with the regexp  `(FRA.*?)(?=:)`

# Full Guide
* [Loading Sequences](/documentation/loading_FASTA.md)
* [Loading BLAST annotations](/documentation/loading_BLAST.md)
* [Loading Interpro Scan annotations](/documentation/loading_IPS.md)
* [Publishing mRNA](/documentation/publishing_mRNA.md)
* [Loading biosamples](/documentation/loading_biosamples.md)
* [Loading expression data](/documentation/loading_expression_data.md)

### Special notes

A regular expression is sometimes used to link data back to the mRNA feature.  This is because we only create entities (publish) for mRNA, so analyses that are linked to the polypeptide sequences must be loaded onto the mRNA instead. The regular expression to link is `(FRA.*?)(?=:)`

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
