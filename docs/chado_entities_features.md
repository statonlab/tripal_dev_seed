# Understanding linking records

This section is provided to help users understand why we specify which records data is associated with when loading.

Many of the load steps require you to specify **which Chado record** to associate something with, or **how to find a parent record**.  A polypeptide feature is derived from an mRNA (the "central dogma" in biology): the mRNA record in chado.feature is the **parent** record of the polypeptide record in chado.feature.  


### Who is the Entity?

Note that this guide is written assuming that your **entity records** (the records that Tripal creates pages for) will be mRNA **only**.  Other features are still created in Chado, they just dont have their own dedicated page.  This is to prevent a user from ahving to click through from a scaffold to a gene to an mRNA to a protein just to see the protein sequence.  This means, however, that when you load in annotations for other features, you have to take care of what the annotation is associated with.  Interproscan annotations, for example, we associate with the mRNA, despite running them on the protein, because we want them to show up on the mRNA page.  This is the purpose of the regular expressions and specifying the type when running these loaders.

### Load Order and Regular Expressions


We (HardwoodGenomics, the developers fro this module) have a history of loading the FASTA files to create feature records for mRNA, then loading proteins, and finally the GFF. This means we link the proteins to the mRNA at the FASTA loader step.
In order for this to work, you need a regexp that can link protein to mRNA.  In subsequent loading steps, where annotations were done using the protein, we associate the annotations with the **parent mRNA** instead (see above for why).

For most genbank entries, this wont work. The numbers assigned to the protein XP_0000 record and the XM_0000 record might be different!  In these situations, you must load the GFF first, which hopefully manually designates which proteins belong to which mRNA.  However, when you load the annotations done with the proteins (such as the interproscan annotations) they will associate with the protein.

Without a regular expression to link these, you may instead opt to create entity records for the proteins as well as the mRNA.  Alternatively, custom fields would need to be created to display, for example, Interproscan annotations associated with proteins on the parent MRNA page (this is what is currently done with the protein sequence field, for example).
