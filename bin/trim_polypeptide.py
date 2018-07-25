from Bio import SeqIO
import sys, getopt, math, re
from os import path


def main(argv):
    usage = 'trim_polypeptide.py [trimmed mrna FASTA] [polypeptide FASTA] [regexp]'
    out_count = 1
    if len(argv) < 3:
        print usage
        sys.exit()
    mrna = argv[0]
    polyp = argv[1]
    regexp = argv[2]
    selected_mrna = []

    mrna_path = "out/sequences/mrna_mini.fasta"
    polyp_path = path.relpath(polyp)

    ofh = open("out/sequences/polypeptide_mini.fasta", "w")
    count = 0

    fasta_sequences = SeqIO.parse(open(mrna_path), 'fasta')
    for fasta in fasta_sequences:
        name, sequence = fasta.id, str(fasta.seq)
        selected_mrna.append(name)

    fasta_sequences = SeqIO.parse(open(polyp_path), 'fasta')
    for fasta in fasta_sequences:
        prot_name, sequence = fasta.id, str(fasta.seq)
        prot_transformed = re.search(regexp, prot_name)
        if hasattr(prot_transformed, 'group'):
            match = prot_transformed.group(1)
            if prot_transformed.group(1):
                match = prot_transformed.group(1)
            if match in selected_mrna:
                ofh.write('>' + prot_name + '\n' + sequence + '\n')
    ofh.close()


if __name__ == "__main__":
    main(sys.argv[1:])

    """
    Trim polypeptide FASTA to matching MRNA,
     given both FASTA files and a REGEXP.
    """
