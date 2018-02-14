
# Loading FASTA sequences

## Loading the CDS file 

## Loading the Amino Acid (polypeptide) file

At HWG, we don't create pages for the amino acids, just mRNA.  What we do is select the same analysis used for CDS.  The SO sequence type should be *polypeptide*.  Insert an Update and Unique name are acceptable options if using this guide. 

![loader form part one](img/loading_AA_pt1.png)


In the additional options section, you have the option to extract the feature name with a regexp, link your sequences to an external database using a regexp, and to define relationships.  Because our polypeptides are derived from our mRNA CDS, we'll set the **relationship type** to _produced by_, and provide a regexp to link the terms.  If you're following this guide with the _F. excelsior_ miniature dataset, then `(FRA.*?)(?=:)` will work.  You may need to write your own regexp for your own data.

![loader form part two](img/loading_AA_pt2.png)

