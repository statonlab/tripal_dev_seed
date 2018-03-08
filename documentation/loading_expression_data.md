## Load Expression Data

### Create Analysis

You will first need an analysis to associate the expression data.  To do so, navigate to `tripal_content -> + add tripal content -> Analysis`.  

* **Name** - Something along the lines of **Fraxinus Excelsior Expression**.
* **Program, Pipeline, Workflow or Method Name** - 
* **Program Version** -
* **Date Performed** -

### Load the expression data

Expression data is loaded by the `tripal_analysis_expression` module using the Chado Expression loader, located at `admin/tripal/loaders/Chado_Expression_Data_Loader`. Expression data should be in column or matrix format.

* **File Upload** - For this dataset, the simplest method is uploading the **.tsv** file.
* **Analysis** - Select the same analysis specified for the biosamples.
* **Organism** - Select an organism.  In this case, the organism is **European Ash**.
* **Source File Type** - If you're uploading the .tsv file, select **Matrix**. If you're uploaded the .txt files, select **Column**. Keep in mind that if you upload the .tsv file, you do not need to upload the .txt files.
* **Name Match Type** - Select unique name.

All other fields can be ignored. Click **Import expression data**. A green header should appear at the top of the page with a job for you to run. Run it and you're done.

#### Publishing

Publishing is not necessary for expression data, as we don't create any new Tripal Entities.
