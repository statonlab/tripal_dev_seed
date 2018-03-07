If you're reading this guide, you're trying to load Expression data and/or Biosamples into Tripal 3.

# Background

Biological samples are handled by the `tripal_biomaterials` module, which is a piece of the [Tripal Analysis Expression module](https://github.com/tripal/tripal_analysis_expression).  This was originally one mega-module, but it was split up to facilitate maintenance.


# Quick guide

* Load the biosamples using the loader provided by `tripal_biomaterials`.
	- Associate each property with a CVterm!
* Publish the loaded Biosamples
* Load the Expression analysis
	- dont forget to set units in the quantification

# Complete guide
## Load Biosamples

### Do **Not** create an analysis

The biosample importer allows you to specify an analysis: for this pipeline, don't.

### Load the samples

The Biosample loader is provided by the `tripal_biomaterial` module, and is located at `admin/tripal/loaders/chado_biosample_loader`.  Biosamples can be loaded as either an `xml` file, or a set of `csv/tsv` files.  `xml` is preffered, and can be optained from NCBI.  `csv/tsv` format requires that the first line is the column names for the biosample properties.  

![](https://github.com/mestato/statonlabprivate/blob/master/biomaterial_documentation/biodoc_1.png?raw=true)

Select the organism.  Note that loading biomaterials from multiple species at a time is not supported.  Split up your files to load one organism at a time.

![](https://github.com/mestato/statonlabprivate/blob/master/biomaterial_documentation/biodoc_2.png?raw=true)

After your file is uploaded, press the **Check Biomaterials** button to access the *CVTERM FIELD CONFIGURATION* section.  The section will list each property associated with your biosamples.  If a term exists in the CVterm database matching the property, it will appear in this section.  For **every biosample property**, associate the property with a CVterm.  In a perfect world, all terms will map to an established CV (sequence ontology, plant trait ontology, etc).  If no term is listed, or if the only terms listed are biomaterial_property terms, you should 

* Load appropriate CVterms for each property.  You can load an entire CV, or individual CVterms using the CVterm loader located at `admin/tripal/loaders/chado_cvterms`.
* Rename the properties in your source file so that they match existing CVterms.  You can look up available CVterms at `admin/tripal/loaders/chado_cvterms`.
* Re-upload the biosample file, and rerun **Check Biomaterials**.
* Repeat this process until you have suitable CVterms associated with all biosample properties.

That said, you can import your biosamples without assigning CVterms.  In this case, the generic biomaterial_property CV will be used.

![](https://github.com/mestato/statonlabprivate/blob/master/biomaterial_documentation/biodoc_3.png?raw=true)

After clicking Submit, you will need to run the job for the samples to be processed.

![](https://github.com/mestato/statonlabprivate/blob/master/biomaterial_documentation/biodoc_4.png?raw=true)

### Publish the biosamples

Once the samples are loaded, they must be published to appear as entities.  To do so, go to `Content -> Tripal Content -> Publish Tripal Content` and select the **Biological Sample** content type.

Once published, the biomaterial data can be located through the menu under **Content > Tripal Content.** Filter results by **Type > Biological Sample.**

![](https://github.com/mestato/statonlabprivate/blob/master/biomaterial_documentation/biodoc_7.png?raw=true)

Below is an example of successfully uploaded biomaterial data.

![](https://github.com/mestato/statonlabprivate/blob/master/biomaterial_documentation/biodoc_5.png?raw=true)

## Load Expression Data


### Create Analysis

You will first need an analysis to associate the expression data.  To do so, navigate to `tripal_content -> + add tripal content -> Analysis`.  

* **Name**  
* **Program Version**
* **Date Performed**
* **Data Source**

### Load the expression data

Expression data is loaded by the `tripal_analysis_expression` module using the Chado Expression loader, located at `admin/tripal/loaders/Chado_Expression_Data_Loader`.  Expression data should be in column or matrix format.

* **Analysis** - Select the same analysis specified for the biosamples.
* **Organism** - Select an organism.  You can only load data for one organism at a time.
* **Source File Type** - Colum or matrix
* **Name Match Type** - Does the expression data match the feature (the mRNA or mRNA_contig)  name or unique name?
* **File Type Suffix** - The suffix of the files to load. This is used to submit multiple column format files in the same directory. A suffix is not required for a matrix file
* **Regex for Start of Data** - If the expression file has a header, use this field to capture the line that occurs before the start of expression data. This line of text and any text preceding this line will be ignored.
* **Regex for End of Data** - - If the expression file has a footer, use this field to capture teh line that occurs after the end of expression data. This line of text and all text following will be ignored.
* **Units** under **Quantification Details** - The units associated with the expression value, such as "Normalized counts". If you're curious about the rest of the Experimental Design, see the unFAQ

#### Publishing

Publishing is not necessary for expression data, as we don't create any new Tripal Entities.
