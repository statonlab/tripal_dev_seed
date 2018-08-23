# Loading GFF3

## Load the landmarks

First, load the landmark scaffolds.  The repo includes a FASTA file with scaffold names only, no sequences, for this purpose.  Use the FASTA loader as described in the mRNA section: you do not need to define a parent relationship.  You can use the SO term contig for the [type](https://www.ebi.ac.uk/ols/ontologies/so/terms?iri=http%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FSO_0000149).

## Load the GFF file
Consider the example GFF file below.

```
##gff-version 3
Contig0	FRAEX38873_v2	gene	16315	44054	.	+	.	ID=FRAEX38873_v2_000000010;Name=FRAEX38873_v2_000000010;biotype=protein_coding
Contig0	FRAEX38873_v2	mRNA	16315	44054	.	+	.	ID=FRAEX38873_v2_000000010.1;Parent=FRAEX38873_v2_000000010;Name=FRAEX38873_v2_000000010.1;biotype=protein_coding;AED=0.05
Contig0	FRAEX38873_v2	five_prime_UTR	16315	16557	.	+	.	ID=FRAEX38873_v2_000000010.1.5utr1;Parent=FRAEX38873_v2_000000010.1
Contig0	FRAEX38873_v2	exon	16315	16967	.	+	.	ID=FRAEX38873_v2_000000010.1.exon1;Parent=FRAEX38873_v2_000000010.1
Contig0	FRAEX38873_v2	CDS	16558	16967	.	+	0	ID=FRAEX38873_v2_000000010.1.cds1;Parent=FRAEX38873_v2_
```

The below table explains each column.   

| column | ID         | explanation                                                                                                                                   | example value                                                                  |
|--------|------------|-----------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------|
| 1      | seqid      | Name of the landmark chromosome or scaffold (not the feature itself).                                                                         | Contig0                                                                        |
| 2      | source     | Program name, data source, etc                                                                                                                | FRAEX38873_v2                                                                  |
| 3      | type       | Sequence ontology term for type_id of feature                                                                                                 | gene                                                                           |
| 4      | start      | start of the feature.                                                                                                                         | 16315                                                                          |
| 5      | end        | end of the feature.                                                                                                                           | 44054                                                                          |
| 6      | score      | Float value or . The score, because the feature was computationally predicted.  ignore.                                                       | .                                                                              |
| 7      | strand     | Can be = or -.  Refers to the strand of DNA: ignore                                                                                           | +                                                                              |
| 8      | phase      | Can be 0, 1, 2, or .  Refers to the open reading frame, you can ignore.                                                                       | .                                                                              |
| 9      | attributes | This includes the actual name for the feature that will be created (in this case FRAEX38873_v2_000000010).  It also includes the Parent= tag. | ID=FRAEX38873_v2_000000010;Name=FRAEX38873_v2_000000010;biotype=protein_coding |

### Preprocessing

Every line of the GFF file will result in a **new feature**. The above example will create gene, mRNA, five_prime_UTR, exon, CDS, **and protein** features (see below for how to skip protein creation).  If you'd like to not load five_prime_UTR features, for example, delete them from the file beforehand.

### The GFF Importer

First, upload the file.  In order to use the GUI uploader, the file extension should be `.gff` or `.gff3`.  See below for information on GFF types.

#### Landmark Type

The **landmark** is the Chado feature on which the individual features are being mapped.  This is typically a scaffold, contig, or chromosome (we chose contig above).  If your landmarks are not uniquely named for this organism, you can specify the type here.

#### Protein names
As before, you may need to specify a regexp so that your proteins are correctly linked to your mRNA.  Note that if you dont specify a protein regexp, it will look for proteins that are [mrna_name]-protein.  This could result in new proteins being inserted accidentally!  I've submitted a change that will allow you to **skip creating proteins** in this manner, look for it soon.


## A note on GFF versions

GFF files are not the most uniform files around.  There are GFF, GFF2, GTF, and GFF3.  The Tripal GFF loader does its best, but it was designed to work withGFF3.
