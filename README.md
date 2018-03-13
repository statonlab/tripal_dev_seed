
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

## expression
* Fexcelsior_biosamples.xml - three random biosamples from NCBI.
	- LIBEST_026644
	- ERS1887582
	- ERS1887575
	
## kegg_annotations

KEGG annotations generated using the KEGG_KOALA tool, corresponding to the sequence features.

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
