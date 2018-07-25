from Bio import SeqIO
import sys, re, csv
from os import path
import trim_polypeptide


def main(argv):
    usage = 'split_fasta.py [n] [mrna FASTA] [polypeptide FASTA] [polypeptide regexp] [GFF] [GFF key to link mRNA]'
    out_count = 1
    if len(argv) < 5:
        print usage
        sys.exit()
    n = argv[0]
    mrna = argv[1]
    polyp = argv[2]
    regexp = argv[3]
    gff = argv[4]
    gff_mrna_key = argv[5]
    selected_mrna = []

    gff_mrna_key = gff_mrna_key + "="

    mrna_path = path.relpath(mrna)
    polyp_path = path.relpath(polyp)
    gff_path = path.relpath(gff)

    ofh = open("out/sequences/mrna_mini.fasta", "w")
    count = 0

    print ("Trimming " + mrna_path + " to " + str(n) + " sequences.\n")

    fasta_sequences = SeqIO.parse(open(mrna_path), 'fasta')
    for fasta in fasta_sequences:
        if count < int(n):
            name, sequence = fasta.id, str(fasta.seq)
            ofh.write('>' + name + '\n' + sequence + '\n')
            count += 1
            selected_mrna.append(name)
    ofh.close()

    print ("trimming GFF file")
    simple_gff_trimmer(gff_path, selected_mrna, gff_mrna_key)

    print ("trimming polypeptides")

    trim_polypeptide.main([mrna_path, polyp, regexp])

def simple_gff_trimmer(gff_path, selected_mrna, gff_mrna_key):
    with open(gff_path, 'rb') as tsvin, open('out/gff/filtered.gff', 'wb') as gffout:
        tsvin = csv.reader(tsvin, delimiter='\t')
        csvout = csv.writer(gffout, delimiter='\t')
        csvout.writerow(['##gff-version 3'])
        write = False

<<<<<<< HEAD
        stored_genes = {}

=======
>>>>>>> a1d67450ede755fd16cd14e51b1914f4458195cd
        for row in tsvin:
            if len(row) > 1:
                contig = row[0]
                type = row[2]
                info = row[-1]
<<<<<<< HEAD
                if type == 'gene':  #Need to track parents
                    id = find_key(info, 'ID=')
                    stored_genes[id] = row

                if type == 'mRNA':
                    write = False
                    id = find_key(info, gff_mrna_key)
                    if id in selected_mrna:
                        write = True
                        #first write gene parent
                        parent = find_key(info, "Parent=")
                        try:
                            csvout.writerow(stored_genes[parent])
                        except:
                            print "Error!  Could not find parent " + parent + ".\n  Please check your GFF file."
                            exit()
                        csvout.writerow(row)
=======
                if type == 'mRNA':
                    write = False
                    info_split = info.split(';')
                    for item in info_split:
                        id = None
                        match = re.match(gff_mrna_key, item)
                        if hasattr(match, 'group'):
                            id = item.replace(gff_mrna_key, '')
                    if id in selected_mrna:
                        write = True
                        csvout.writerow(row)
                        #we also need to go back and write out the gene.
>>>>>>> a1d67450ede755fd16cd14e51b1914f4458195cd
                else:
                    if write:
                        csvout.writerow(row)


<<<<<<< HEAD
def find_key(info, key):
    info_split = info.split(';')
    result = None
    for item in info_split:
        match = re.match(key, item)
        if hasattr(match, 'group'):
            id = item.replace(key, '')
            result = id
    return result


=======
>>>>>>> a1d67450ede755fd16cd14e51b1914f4458195cd
if __name__ == "__main__":
    main(sys.argv[1:])

    """
    Take a mrna and GFF file.  
    Pick N mRNA at random and trim everything down to that.

    """
