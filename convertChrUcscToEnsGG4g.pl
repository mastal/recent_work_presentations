#!/usr/bin/perl

# 21/08/2014
# Maria Stalteri

# convertChrUCSCToEnsGG4.pl

# Converts UCSC chromosome names to
# Ensembl chromosome names for the 
# galGal4 chicken assembly, using
# the UCSC file ucscToEnsembl.txt, downloaded from
# http://hgdownload.soe.ucsc.edu/goldenPath/galGal4/database/

# file format is 2 columns, no header line,
# ucsc_chr_name\tensembl_chr_name\n

# 21/08/2014
# at the moment, this converts the jumbled file obtained
# from the UCSC Table Browser, which is not in any particular order;
# it has 1 header line, and 6 columns;
# the columsn are separated by \t
#  '#name	chrom	strand	txStart	txEnd	name2'
# NM_001293287	chr1	+	67103062	67110419	KCNJ8


use strict;
use warnings;

# parameters: 
# the ucscToEnsembl file
# the file to be converted
# the output file with the converted chr names

# warn if the script isn't called with the right number 
# of parameters
unless (3 == scalar(@ARGV)){
    die "Usage: $0 ucscToEnsembl_file file_to_convert converted_output_file\n";
}

# open file handles for reading 

# the ucscToEnsembl file is the first input file;
open (IN1, "< $ARGV[0]")
    or die "couldn't open the first input file $ARGV[0] : $!\n";


# the ensembl annotations file is the second input file;
open (IN2, "< $ARGV[1]")
    or die "couldn't open the second input file $ARGV[1] : $!\n";

# open filehandle for the output file with the converted chromosome names;
open (OUT, "> $ARGV[2]")
    or die "couldn't open the output file $ARGV[2] : $!\n";




my %uc2Ens;

# read the ucscToEnsembl file:
while (my $line = <IN1>){

    # the ucsc chromosome names should all begin with 'chr'
    if ($line =~ /^(chr\w+)\t([\w\.]+)$/){
  
        # $1 is the ucsc chr name
        # $2 is the ensembl chr name
        $uc2Ens{$1} = $2;

    }
    else{
        # line doesn't match regex, print warning to screen
        print "Line $line doesn't match regex.\n";
    }      

} # end while


# read the ucsc file that needs the chr names converted to ensembl format
while (my $line2 = <IN2>){
    
    # the header line will not match the regex
    if ($line2 =~ /^(N[MR]_\d{6,9})\t(chr\w+)\t(.+)\n/){
  
        # col.1 is the RefSeq ID
        # col.2 is the ucsc chr name
        # $1 is the RefSeq ID
        # $2 is the chromosome name
        # $3 is the rest of the line       
        

        my $RSID = $1;
        my $ucscChr = $2;
        my $restOfLine = $3;

        if (exists $uc2Ens{$ucscChr}) {


        print OUT "$RSID\t$uc2Ens{$ucscChr}\t$restOfLine\n";  

        }

        else{
            # flag warning
            print "Chromosome name from ucsc genes file at line $line2 not found in conversion table.\n";
     

        }
    
    }
    else{
        # line doesn't match regex, print warning to screen
        print "Line from ucsc file $line2 doesn't match regex.\n";
    }





} # end while


# close filehandles

close(IN1)
    or die "couldn't close the first input file $ARGV[0] : $!\n";

close(IN2)
     or die "couldn't close the second input file $ARGV[1] : $!\n";

close(OUT)
     or die "couldn't close the output file $ARGV[2] : $!\n";

