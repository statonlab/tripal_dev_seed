
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

### expression
* Fexcelsior_biosamples.xml - three random biosamples from NCBI.
	- WZ0AFEAA
	- ERS1887582
	- ERS1887583

## Set up

* Create an organism for Fraxinus excelsior (common name: European Ash)
* Create analyses to associate the data with.  We currently use 1 analyses per content item.
* Use the FASTA loader ot load in the CDS first, then the proteins.
* Use the `tripal_analysis_blast` blast XML loader ot load the Fexcelsior data.  This gets associated with the mRNA.
* Publish the mRNA.
* Use the `tripal_analyssi_interpro` to load the interproscan data.
* Publish the proteins.

A full guide will be written soon.

### Adding expression data

Prior to loading in expression data, you will create an analysis for the experiment (what was previously an expression_analysis), and then load biosamples associated with that expression analysis.

* Create an analysis for the expression experiment
* 

### Special notes

* Protein loading: regexp to link