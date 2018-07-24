from Bio import SeqIO
import sys
from os import path
import csv
import trim_polypeptide


def main(argv):
    usage = 'split_fasta.py [n] [mrna FASTA] [polypeptide FASTA] [polypeptide regexp] [GFF]'
    out_count = 1
    if len(argv) < 4:
        print usage
        sys.exit()
    n = argv[0]
    mrna = argv[1]
    polyp = argv[2]
    regexp = argv[3]
    gff = argv[4]
    selected_mrna = []

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
    simple_gff_trimmer(gff_path, selected_mrna)

    print ("trimming polypeptides")

    trim_polypeptide.main([mrna_path, polyp, regexp])

def simple_gff_trimmer(gff_path, selected_mrna):
    with open(gff_path, 'rb') as tsvin, open('out/gff/filtered.gff', 'wb') as gffout:
        tsvin = csv.reader(tsvin, delimiter='\t')
        csvout = csv.writer(gffout, delimiter='\t')
        csvout.writerow(['##gff-version 3'])
        write = False

        for row in tsvin:
            if len(row) > 1:
                contig = row[0]
                type = row[2]
                info = row[-1]
                if type == 'mRNA':
                    write = False
                    info_split = info.split(';')
                    id = info_split[0]
                    id = id.replace('ID=', '')
                    if id in selected_mrna:
                        write = True
                        csvout.writerow(row)
                else:
                    if write:
                        csvout.writerow(row)


if __name__ == "__main__":
    main(sys.argv[1:])

    """
    Take a mrna and GFF file.  
    Pick N mRNA at random and trim everything down to that.

    """
