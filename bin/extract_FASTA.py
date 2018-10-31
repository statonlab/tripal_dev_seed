from Bio import SeqIO
import sys, getopt, math, re

def main(argv):
    usage = 'extract_FASTA.py -i <input file> -l newline seperated list of header names.'
    input_file = ''
    out_count = 1
    try:
        opts, args = getopt.getopt(argv, "hi:l:", ["ifile="])
        # all of the tutorials use getOptError but mine was out of date!
    except getopt.error:
        print usage
        sys.exit(2)

    for opt, arg, in opts:
        if opt == '-h':
            print usage
            sys.exit()
        elif opt in ("-i", "--ifile"):
            input_file = arg
        elif opt == "-l":
            name_file = arg


    seq_names = []

    names = open(name_file, 'r').readlines()
    for line in names:
        seq_names.append(line.rstrip())

    out_prefix = re.sub('.*(.*\/)', '', input_file)

    output_file = out_prefix + "." + "mini"
    ofh = open(output_file, "w")

    fasta_sequences = SeqIO.parse(open(input_file), 'fasta')
    for fasta in fasta_sequences:
        fasta_name, sequence = fasta.id, str(fasta.seq)
        name_in_list = False

        for query in seq_names:
            if fasta_name == query:
                name_in_list = True

        if name_in_list:
            ofh.write('>' + fasta_name + '\n' + sequence + '\n')
    ofh.close()

if __name__ == "__main__":
    main(sys.argv[1:])

    """"
    A module can discover whether or not it is
     running in the main scope by checking its own __name__,
      which allows a common idiom for conditionally executing code
      in a module when it is run as a script or
     with python -m but not when it is imported:
    """
