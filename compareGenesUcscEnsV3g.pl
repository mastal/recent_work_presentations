#!/usr/bin/perl

# compareGenesUcscEnsV3g.pl
# 20/08/2014
# Maria Stalteri

# adapted from final-comparator.pl,
# but uses a sort of filtering strategy

# this part only looks for perfect matches

# 22/08/2014 
# compareGenesUcscEnsV2.pl
# this only does the perfect matches,
# same gene symbol, same strand part

# 27/08/2014
# compareGenesUcscEnsV3.pl
# use theinput files where the mirna gene
# symbols have been modified to be same as ensembl;

# change regular expressions to use the original
# downloaded data which has not been modified in Excel!
# Need to do this for the ensembl data from biomart
# as well;

use strict;
use warnings;

# warn if the script isn't called with the right number 
# of parameters
unless (2 == scalar(@ARGV)){
    die "Usage: $0 path/to/input/file1 path/to/input/file2\n";
}

# get the names of the input files from the
# commandline parameters:
# open file handles for reading

# the ucsc file is the first input file;
open (INFILE1, "< $ARGV[0]")
    or die "couldn't open the first input file $ARGV[0] : $!\n";

my @ucsc = <INFILE1>;

close(INFILE1)
    or die "couldn't close the first input file $ARGV[0] : $!\n";

# the ensembl annotations file is the second input file;
open (INFILE2, "< $ARGV[1]")
    or die "couldn't open the second input file $ARGV[1] : $!\n";

my @ens = <INFILE2>;

close(INFILE2)
     or die "couldn't close the second input file $ARGV[1] : $!\n";


# find array lengths of each file
# and print result to screen

my $arraySize1 = scalar(@ucsc);
my $arraySize2 = scalar(@ens);

print "The length of the first array is:  $arraySize1 \n";
print "The length of the second array is:  $arraySize2 \n";


# loop through the array made from the ucsc file
foreach my $line1 (@ucsc){

    # the columns in the data as downloaded from the ucsc table browser are:
    # col.1 is the RefSeq ID
    # col.2 is the chr (converted to ensembl format)
    # col.3 is the strand (+/-)
    # col.4 is the start coord
    # col.5 is the end coord
    # col.6 is the gene symbol, with mirnas modified to ensembl format

    chomp($line1);
    my ($gene1, $chr1, $ucscStrand1, $start1, $end1, $sym1) = split(/\t/, $line1);

    # the variable that represents the start coord of 
    # the first file, now the ucsc file, is $start1;
    # add 1 to the start coord to make it comparable to ensembl;

    $start1++;

    my $strand1;
    # change the strand symbols to be compatible to ensembl
    if ($ucscStrand1 eq '+'){
        $strand1 = '1';
    }
    elsif ($ucscStrand1 eq '-'){
        $strand1 = '-1';
    }
    else{
        print "Strand symbol doesn't match, ucsc file, line \n $line1.";
    }

    # loop through the array made from the ensembl annotation data  
    # and separate each tab-delimited column into individual variables

    # add a counter variable to indicate whether a match was found
    # for the line from the ucsc file,
    # if a match is found, don't look for more matches,
    # if a match is not found, make a new array with only
    # the unmatched lines, and scan it again;
    my $matched1 = 0;
   
    # the first run through the loops, only look for perfect matches
    foreach my $line2 (@ens) {

        chomp($line2);
        
        # comment out old line 2 from file with re-ordered columns
        # my ($chr2, $start2, $end2, $strand2, $sym2, $gene2) = split(/\t/, $line2);

        # MS 29/08/2014 NOTE THAT the Biomart results...txt file has a header line
        # which does not even start with a # sign.
        # How this is working with the split function, I don't know
        # the first 3 lines of the biomart file:
        # Ensembl Gene ID	Gene Start (bp)	Gene End (bp)	Chromosome Name	Strand	Associated Gene Name
        # ENSGALG00000028748	1214	4060	AADN03019658.1	-1	
        # ENSGALG00000005149	8530	20071	JH375193.1	1	FAM222A


        # col.1 is ensembl gene id
        # col.2 is start coord
        # col.3 is end coord
        # col.4 is chr
        # col. 5 is strand
        # col. 6 is gene symbol, missing in some cases
 
        # modify file by removing the lines with missing gene
        # symbol to a new file; 

        my ($gene2, $start2, $end2, $chr2, $strand2, $sym2) = split(/\t/, $line2);

        # 1. check if chromosome matches

        if ($chr1 eq $chr2) {
            
            # 2. check if strand matches
 
            if ($strand1 eq $strand2) {

                # 3. if chr and strand match, check coordinates.
                # coordinates type A: perfect match
                if ($start1 == $start2 && $end1 == $end2) {


                    # 4. check if gene symbol is same or not
                    if ($sym1 eq $sym2) {
                       
                         # found a match, so change value of $matched1
                         $matched1 = 1;

                         # Match type: A1, perfect match, same strand, same gene symbol;
                         # Match 16; Output file 8;
                         #criteria 2 for coordinate match. Boolean operation 2
                         # open(MYOUTFILE, ">>same-gene-strand-same-strand-perfect-matches.txt"); #open for write, append

                         open (MYOUTFILE, ">> same_str_same_sym_perf_match.txt");
                         print MYOUTFILE "$line1\t$line2\n";
                         close(MYOUTFILE);
                    
                    } # 4. end if chr/strand/coords/gene symbol perfect match                   
                 
                } # 3. end if coordinates match perfectly
            } # 2. end if strand matches

        } # 1. end if chr matches
        else{
           # chr doesn't match
           next;
        } # 1. end else chr doesn't match       

    } # end foreach ensembl array
   

    # if $matched1 is 0, there was no perfect match for this line of ucsc file,
    # so print the line to a new file, and include in next round of matchings

    if (0 == $matched1) {

       open (MYOUTFILE, ">> ucsc_minus_same_sym_perf_matches.txt");
       print MYOUTFILE "$line1\n";
       close(MYOUTFILE);
   
    }
    
} # end foreach ucsc array

# start over with the new input file
# I had suggestions from HRP and WL to implement some 
# kind of scoring system;


# this is going to be the kind of repetitive thing
# where I should use a subroutine to do the different 
# matching operations, or rewrite the script to only do 
# a certain matching operation
