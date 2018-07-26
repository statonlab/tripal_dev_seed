import sys, re, csv
from os import path

def main(argv):
    usage = 'create_empty_landmarks.py [GFF file]'
    if len(argv) < 1:
        print usage
        sys.exit()

    gff = argv[0]
    gff_path = path.relpath(gff)

    contigs = {}
    with open(gff_path, 'rb') as tsvin:
        tsvin = csv.reader(tsvin, delimiter='\t')
        for row in tsvin:
            if len(row) > 1:
                contig = row[0]
                contigs[contig] = contig

    with open('out/sequences/empty_landmarks.fasta', 'wb') as landmark_out:
        for contig in contigs:
            print ">" +contig + "\n"


if __name__ == "__main__":
    main(sys.argv[1:])

    """

    """
