
This dataset is the first 200 genes of the Fraxinus excelsior dataset.  Use it to quickly seed a Tripal site with data.

See the description and credits for the full dataset on [Hardwoods Genomics Project](https://hardwoodgenomics.org/content/European-Ash).
## Files

### mRNA
* FexcelsiorCDS.fasta - mRNA
* Fexcelsior.blastx.sprot.xml - swissprot annotations for these mRNA
* Fexcelsior.blastx.trembl.xml - TREMBL annotations for these mRNA

### protein
* FexcelsiorAA.minoas.fasta - predicted amino acids
* ips/* - interproscan annotations for the predicted amino acids

Note that to load the proteins, you must link them with the regexp `(FRA.*?)\.1`

### expression
* Fexcelsior_biosamples.xml - three random biosamples from NCBI.
	- LIBEST_026644
	- ERS1887582
	- ERS1887575
# Database Backup

Backup databases are available with most of this data loaded.  The current database 12-19-17 is a first stab at this.


## Quick Set Up

* Create an organism for Fraxinus excelsior (common name: European Ash)
* Create analyses to associate the data with.  We currently use 1 analyses per content item.
* Use the FASTA loader ot load in the CDS first, then the proteins.
* Use the `tripal_analysis_blast` blast XML loader ot load the Fexcelsior data.  This gets associated with the mRNA.
* Publish the mRNA.
* Use the `tripal_analyssi_interpro` to load the interproscan data.
* Publish the proteins.
* Load Biosamples/Biomaterials
* Load Expression data for Biosamples


# Full Guide
Under Construction!

# Creating the organism

# Creating the analysis

## Loading the sequences

[Sequence loading guide](/documentation/loading_FASTA.md)

## Loading annotations
Before you load in blast XML annotations, make sure you have an analysis for the annotation run.  Also make sure that you have the *database* loaded.  We BLAST against TREMBL and an abbreviated Swissprot (**Double check this!**).

So: we associate the interproscan annotations with the *parent* IE the mRNA.  so you provide a regexp that will match mRNA.


### Adding expression data

Prior to loading in expression data, you will create an analysis for the experiment (what was previously an expression_analysis), and then load biosamples associated with that expression analysis.


### Special notes

* Protein loading: regexp to link `(FRA.*?)(?=:)`

