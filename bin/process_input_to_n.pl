#!/usr/bin/env perl
#simple Bioperl script to extract seqs from FASTA file.

use strict;
use warnings;
use Bio::SeqIO;
use Data::Dumper;
use File::Basename;

# usage
my $usage = "$0  \narguments: n (number of sequences to use), mrna fasta file, protein fasta file, GFF file \n";

my ($num_seqs, $mrna_file, $protein_file, $gff_file) = @ARGV;


my $count = 0;
my %selected_seqs;

# open input mrna file
unless( -e $mrna_file ){
	die "error: cannot find fasta input file $mrna_file\n";
}
my $input = Bio::SeqIO->new (-file => "<$mrna_file", '-format' => 'Fasta')
	or die "error: failure opening fasta $mrna_file for reading: $!\n";

# make temporary fasta file and print header line
my $output_file =  basename($mrna_file);

$output_file =  $output_file . ".out.fasta";
my $output_path =  "output/" . $output_file;

open( OUT, ">$output_path" )
	or die "error: cannot open $output_file for writing: $!\n";
# step through sequences in input fasta file
while( my $seqObject = $input->next_seq ){
	if ($count <= $num_seqs){
	my $id  = $seqObject->id;
	my $seq = $seqObject->seq;

	## replace the full ID with just the ref, since thats whats in the GFF.
	my $find = "^[^ref]*ref";
	my $replace = "ref";
	$id  =~ s/$find/$replace/;

	$selected_seqs{$id} = $id; 
	print OUT ">$id\n","$seq\n";  
	$num_seqs ++;
	}
}

close( OUT)

open(my $fh_gff, '<:encoding(UTF-8)', $gff_file)
  or die "Could not open file '$gff_file': $!";


my $gff_out = generateOut($gff_file, ".out.gff")
# make temporary fasta file and print header line

open( OUT, ">$gff_out" )
	or die "error: cannot open $gff_out for writing: $!\n";

 
while (my $row = <$fh_gff>) {
  chomp $row;

foreach my $key (keys %selected_seqs) { 


if($ =~ m/\Q$key/) {
	print OUT $row;
	}
 }
}

close (OUT)



sub generateOut($input_file, $extension) {
	$output_file =  basename($input_file);
	$output_file =  $output_file . $extension;
	$output_path =  "output/" . $output_file;
	return $output_path;
}

