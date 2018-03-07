# Creating An Analysis

To load a blast analysis, navigate to **Content > Tripal Content**. At the top of the page, click **Add Tripal Content** and select **Organism** from the list of content types.

Enter data into the following fields:

* **Analysis Name** - The name should be something like **Interpro Analysis of ( )**. For example: **Interpro Analysis of Honey Locust (Gleditsia triacanthos).**
* **Program, Pipeline Name or Method Name** - This should be InterProScan.
* **Program, Pipeline or Method version** - The version of interproscan. For example, 5.4-47.0.
* **Date Performed** - This should be the date the blast was run. If the blast process of scripts took several days, use the first day the job was created. If no date can be ascertained, then use 01, 01, 1900. 

Other fields may be left at their default values or empty. Click save.

![](https://github.com/jwest60/tripal_dev_mini_dataset/blob/load-blast/documentation/img/ips/ipsdoc_1.png)

# Loading InterProScan Results

The InterProScan loader is handled by the `tripal_analysis_interpro` module. The InterProScan loader can only load data from InterProScan results in the xml format.

Locate the InterProScan loader from the menu through **Tripal > Data Loaders > Chado BLAST XML Results Loader.**

* **XML File** - You will need to upload an entire directory of xml files, so enter a server path that will locate the directory containing the xml files of the InterProScan results.
* **Analysis** - Select the newly created interpro analysis.
* **Query Name RE** - You will need to use the same regexp you used to load in the polypeptides. For this dataset, the regexp is `(FRA.*?)(?=:)`.

Other fields may be left at their default values or empty. Click **Import File** at the bottom of the page. You will need to run the job provided.

![](https://github.com/jwest60/tripal_dev_mini_dataset/blob/load-blast/documentation/img/ips/ipsdoc_2.png)

# Viewing InterProScan Results

Unless specified otherwise, InterProScan results are hidden by default.

From the menu, navigate to **Structure > Tripal Content Types.** In the new window, select **manage display** in the table next to the content type **mRNA.**

At the bottom of this window is a field of **disabled** content types, under which **InterPro results** should be located. Drag InterPro results out of the disabled field.

Blast results should now be viewable in any mRNA content.

**NOTE:** If InterPro results does not appear as a field, navigate to **manage fields** and click **Check for new fields.**

![](https://github.com/jwest60/tripal_dev_mini_dataset/blob/load-blast/documentation/img/ips/ipsdoc_3.png)
