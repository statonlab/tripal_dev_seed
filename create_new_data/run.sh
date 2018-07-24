
#blast nucleotide against TREMBL
blastx \
-query $input_nuc \
-db /db/trembl.fasta \
-out /out/TREMBL_$input_nuc.xml  \
-evalue 1e-5 \
-outfmt 5
#blast nucleotide against SPROT

blastx \
-query $input_nuc \
-db /db/uniprot_sprot.fasta \
-out /out/SPROT_$input_nuc.xml  \
-evalue 1e-5 \
-outfmt 5

#run IPS
interproscan.sh \
-i $input_prot \
-f XML, tsv \
-d /out/ips/ \
--disable-precalc \
--iprlookup \
--goterms \
--pathways \
# --tempdir /lustre/projects/staton/projects/hwg_tmp_anlaysis_files/Jregia/ips/TMP \
# >& /lustre/projects/staton/projects/hwg_tmp_anlaysis_files/Jregia/ips/TMP/$SGE_TASK_ID.out

#generate Biomaterials

#Create false expression data