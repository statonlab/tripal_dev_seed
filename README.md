[![DOI](https://zenodo.org/badge/107319541.svg)](https://zenodo.org/badge/latestdoi/107319541)


![Tripal Dev Seed logo](/tripal_devseed.png)

This dataset is the first 200 genes of the Fraxinus excelsior dataset.  Use it to quickly seed a Tripal site with data.

See the description and credits for the full dataset on [Hardwoods Genomics Project](https://hardwoodgenomics.org/content/European-Ash).
# Files
## sequences
* FexcelsiorCDS.fasta - mRNA
* FexcelsiorAA.minoas.fasta - predicted amino acids/polypeptides

## blast_annotations
* Fexcelsior.blastx.sprot.xml - swissprot annotations for these mRNA
* Fexcelsior.blastx.trembl.xml - TREMBL annotations for these mRNA

## interproscan_annotations
* *.xml - interproscan annotations for the predicted amino acids, ~ one xml per entry.

## biosamples
There are two sets of mock expression data provided.  Data was seeded from NCBI but attributes have been modified.

## expression_data
Expression data corresponding to biosample sets 1 and 2.

Both sets include the matrix format file (`matrix_format.tsv`), which is easiest to load.

Set 1 also includes each individual biosample's expression data in column format: `LIBEST_026644`,  `ERS1887582`, and `ERS1887575`.

## kegg_annotations

KEGG annotations generated using the KEGG_

tool, corresponding to the sequence features.

## documentation
	
## database_backups

Backup databases are available with most of this data loaded.  The current database 12-19-17 is a first stab at this.


## Quick Set Up

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

### Software versioning
The dev seed dataset was generated using the following software and versions.

* [BLAST](https://www.ncbi.nlm.nih.gov/books/NBK279671/) 2.2.18+
* [InterproScan]()
* SWISSPROT database
* TREMBL database
* [KEGG Ghost KOALA](https://www.kegg.jp/ghostkoala/) 2.0
* [MAFFT](https://mafft.cbrc.jp/alignment/software/) 7.402


# License and Contributing

This project is open source and provided under the [GPL-3.0 license](https://github.com/statonlab/tripal_alchemist/blob/master/LICENSE).  It was created by Bradford Condon and Meg Staton from the University of Tennessee Knoxville.  If you would like to make a contribution, simply fork the repo and make a pull request from there.

The project "logo" is derived from the collectible card game Hearthstone, copyright © Blizzard Entertainment, Inc. Hearthstone® is a registered trademark of Blizzard Entertainment, Inc. Tripal Alchemist is not affiliated or associated with or endorsed by Hearthstone® or Blizzard Entertainment, Inc.
