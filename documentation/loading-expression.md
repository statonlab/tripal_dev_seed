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
* **Source File Type** - Column or matrix
* **Name Match Type** - Does the expression data match the feature (the mRNA or mRNA_contig)  name or unique name?

#### Publishing

Publishing is not necessary for expression data, as we don't create any new Tripal Entities.
