
First, load the landmark scaffolds.



* Upload the file.  In order to use the GUI uploader, the file extension should be `.gff` or `.gff3`.

* Landmark Type

The **landmark** is the Chado feature on which the individual features are being mapped.  This is typically a scaffold, contig, or chromosome.  If your landmarks are not uniquely named for this organism, you can specify the type here.

* Protein names
As before, you may need to specify a regexp so that your proteins are correctly linked to your mRNA.  Note that if you dont specify a protein regexp, it will look for proteins that are [mrna_name]-protein.  This could result in new proteins being inserted accidentally!  I've submitted a change that will allow you to **skip creating proteins** in this manner, look for it soon.




### A note on GFF versions

GFF files are not the most uniform files around.  There are GFF, GFF2, GTF, and GFF3.  The Tripal GFF loader does its best, but it was designed to work withGFF3.

