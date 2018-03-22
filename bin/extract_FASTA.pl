#!/usr/bin/env perl
#simple Bioperl script to extract seqs from FASTA file.

use strict;
use warnings;
use Getopt::Long;
use Bio::SeqIO;
use Data::Dumper;
# usage
my $usage = "$0 -i|input fasta_input_files -l|list list of FASTA headers to extract \n";

# global values
my $input_file;
my $list_file;
# read user options
GetOptions(
	"i|input=s" => \$input_file,
	"l|list=s" => \$list_file,

);

# check for user parameters
if( !$input_file ){
	die $usage;
}
if( !$list_file ){
	die $usage;
}

#open list file
my %listhash;
open(my $fh, "<", $list_file)
			or die "couldnt open '$list_file' $!";
						
			while (my $line = <$fh>){
				chomp $line;
				##Build hash of the list file.
				$listhash{$line} =$line;
			}


# open input fasta file
unless( -e $input_file ){
	die "error: cannot find fasta input file $input_file\n";
}
my $input = Bio::SeqIO->new (-file => "<$input_file", '-format' => 'Fasta')
	or die "error: failure opening fasta $input_file for reading: $!\n";

# make temporary fasta file and print header line
my $output_file = "$list_file.out.fasta";
open( OUT, ">$output_file" )
	or die "error: cannot open $output_file for writing: $!\n";
# step through sequences in input fasta file
while( my $seqObject = $input->next_seq ){
	
	# get sequence information
	my $id  = $seqObject->id;
	my $seq = $seqObject->seq;

	if ($listhash{$id}){
		print "extracting $id\n";
		print OUT ">$id\n","$seq\n";  
	}
}

