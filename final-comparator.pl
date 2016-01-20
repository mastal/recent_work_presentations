#####You can send your comments to ucbtmaf@ucl.ac.uk
#####This code uses a combination of boolean operations to find overlapping coordinates between ensembl and UCSC genes/transcripts. It has been designed to
#####read Gene Transfer Files from ensembl and compare them against refseq gene data from UCSC. Gene symbols from both are reported so that similarities/differences
#####between their annotations can be assessed.Full overlapping as well as partial overlapping coordinate ranges are detected. Feel free to improve
#####this code and redistribute it.


#!/usr/bin/perl


#open the existing gtf file and save the contents in @list1
open (INFILE, "<ensembl-in.txt") or die ("couldn't open the file gtf-gal4-formatted.txt: $!\n");
my @list1 = <INFILE>;
close(INFILE);


#open the UCSC annotation file and save contents to @list2 
open(INFILE, "<ucsc-in.txt") or die ("couldn't open the file gal4-ucsc.txt: $!\n");
my @list2 = <INFILE>;
close(INFILE);


#find array lengths of each
$arraySize = @list1;
$arraySize2 = @list2;


#loop through @list1 (where GTF file contents are stored) and separate each tab-delimited column into individual variables
foreach my $list1(@list1) {

chomp($list1);

my @array1=split(/\s+/, $list1);

my $array1;

my $entry1=$array1[0];
my $entry2=$array1[1];
my $entry3=$array1[2];
my $entry4=$array1[3];
my $entry5=$array1[4];
my $entry6=$array1[5];




#loop through @list2 (where UCSC annotation data is stored) and separate each tab-delimited column into individual variables 
foreach my $list2(@list2) {

chomp($list2);

my @array2=split(/\s+/, $list2);

my $array2;

my $entry10=$array2[0];
my $entry11=$array2[1];
my $entry12=$array2[2];
my $entry13=$array2[3];
my $entry14=$array2[4];
my $entry15=$array2[5];


#same-strand-and-different-perfect-overlaps

if($entry1 eq $entry10 && $entry2 == $entry11 && $entry3 == $entry12 && $entry4 != $entry13 && $entry5 ne $entry14) {


$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">strand-specific-perfect-matches.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>strand-specific-perfect-matches.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";

$k = 0;


close(MYOUTFILE);



}

#criteria 2 for coordinate match. Boolean operation 2

if($entry1 eq $entry10 && $entry2 == $entry11 && $entry3 == $entry12 && $entry4 == $entry13 && $entry5 ne $entry14) {


$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">strand-same-strand-perfect-matches.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>strand-same-strand-perfect-matches.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";

$k = 0;


close(MYOUTFILE);



}


#different-gene-symbols-different-strands-all-partial-overlaps

if($entry1 eq $entry10 && $entry2 < $entry11 && $entry3 > $entry11 && $entry3 <= $entry12 && $entry4 != $entry13 && $entry5 ne $entry14) {


$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">strand-specific-gene-partial-overlaps.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>strand-specific-gene-partial-overlaps.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";


$k = 0;


close(MYOUTFILE);



}

#criteria 4 for coordinate match. Boolean operation 4

if($entry1 eq $entry10 && $entry11 < $entry2 && $entry11 > $entry3 && $entry12 <= $entry3 && $entry4 != $entry13 && $entry5 ne $entry14) {


$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">strand-specific-gene-partial-overlaps.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>strand-specific-gene-partial-overlaps.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";


$k = 0;


close(MYOUTFILE);



}

#criteria 5 for coordinate match. Boolean operation 5


if($entry1 eq $entry10 && $entry2 > $entry11 && $entry12 > $entry2 && $entry12 <= $entry3 && $entry4 != $entry13 && $entry5 ne $entry14) {


$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">strand-specific-gene-partial-overlaps.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>strand-specific-gene-partial-overlaps.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";


$k = 0;


close(MYOUTFILE);



}


#criteria 6 for coordinate match. Boolean operation 6

if($entry1 eq $entry10 && $entry11 > $entry2 && $entry2 > $entry12 && $entry3 <= $entry12 && $entry4 != $entry13 && $entry5 ne $entry14) {


$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">strand-specific-gene-partial-overlaps.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>strand-specific-gene-partial-overlaps.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";


$k = 0;


close(MYOUTFILE);



}


#different-gene-different-strand-genes-within

if($entry1 eq $entry10 && $entry2 > $entry11 && $entry3 < $entry12 && $entry4 != $entry13 && $entry5 ne $entry14) {


$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">strand-specific-gene-annotations.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>strand-specific-gene-annotations.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";

$k = 0;


close(MYOUTFILE);



}

#criteria 2 for coordinate match. Boolean operation 2

if($entry1 eq $entry10 && $entry11 > $entry2 && $entry12 < $entry3 && $entry4 != $entry13 && $entry5 ne $entry14) {



$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">strand-specific-gene-annotations.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>strand-specific-gene-annotations.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";

$k = 0;


close(MYOUTFILE);

}



#different-genes-same-strand-partial-overlaps-all

if($entry1 eq $entry10 && $entry2 < $entry11 && $entry3 > $entry11 && $entry3 <= $entry12 && $entry4 eq $entry13 && $entry5 ne $entry14) {


$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">strand-same-gene-partial-overlaps.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>strand-same-gene-partial-overlaps.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";


$k = 0;


close(MYOUTFILE);



}

#criteria 4 for coordinate match. Boolean operation 4

if($entry1 eq $entry10 && $entry11 < $entry2 && $entry11 > $entry3 && $entry12 <= $entry3 && $entry4 eq $entry13 && $entry5 ne $entry14) {


$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">strand-same-gene-partial-overlaps.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>strand-same-gene-partial-overlaps.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";


$k = 0;


close(MYOUTFILE);



}

#criteria 5 for coordinate match. Boolean operation 5


if($entry1 eq $entry10 && $entry2 > $entry11 && $entry12 > $entry2 && $entry12 <= $entry3 && $entry4 eq $entry13 && $entry5 ne $entry14) {


$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">strand-same-gene-partial-overlaps.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>strand-same-gene-partial-overlaps.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";


$k = 0;


close(MYOUTFILE);



}


#criteria 6 for coordinate match. Boolean operation 6

if($entry1 eq $entry10 && $entry11 > $entry2 && $entry2 > $entry12 && $entry3 <= $entry12 && $entry4 eq $entry13 && $entry5 ne $entry14) {


$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">strand-same-gene-partial-overlaps.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>strand-same-gene-partial-overlaps.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";


$k = 0;


close(MYOUTFILE);



}

#different-genes-same-strand-genes-within

if($entry1 eq $entry10 && $entry2 > $entry11 && $entry3 < $entry12 && $entry4 eq $entry13 && $entry5 ne $entry14) {


$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">strand-same-gene-annotations.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>strand-same-gene-annotations.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";

$k = 0;


close(MYOUTFILE);



}

#criteria 2 for coordinate match. Boolean operation 2

if($entry1 eq $entry10 && $entry11 > $entry2 && $entry12 < $entry3 && $entry4 eq $entry13 && $entry5 ne $entry14) {



$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">strand-same-gene-annotations.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>strand-same-gene-annotations.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";

$k = 0;


close(MYOUTFILE);

}

#same-gene-same-and-different-strands-perfect-match

if($entry1 eq $entry10 && $entry2 == $entry11 && $entry3 == $entry12 && $entry4 != $entry13 && $entry5 eq $entry14) {


$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">same-gene-strand-specific-perfect-matches.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>same-gene-strand-specific-perfect-matches.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";

$k = 0;


close(MYOUTFILE);



}

#criteria 2 for coordinate match. Boolean operation 2

if($entry1 eq $entry10 && $entry2 == $entry11 && $entry3 == $entry12 && $entry4 == $entry13 && $entry5 eq $entry14) {


$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">same-gene-strand-same-strand-perfect-matches.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>same-gene-strand-same-strand-perfect-matches.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";

$k = 0;


close(MYOUTFILE);



}


#same-genes-same-strands-partial-overlaps-all

if($entry1 eq $entry10 && $entry2 < $entry11 && $entry3 > $entry11 && $entry3 <= $entry12 && $entry4 eq $entry13 && $entry5 eq $entry14) {


$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">same-gene-strand-same-gene-partial-overlaps.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>same-gene-strand-same-gene-partial-overlaps.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";


$k = 0;


close(MYOUTFILE);



}

#criteria 4 for coordinate match. Boolean operation 4

if($entry1 eq $entry10 && $entry11 < $entry2 && $entry11 > $entry3 && $entry12 <= $entry3 && $entry4 eq $entry13 && $entry5 eq $entry14) {


$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">same-gene-strand-same-gene-partial-overlaps.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>same-gene-strand-same-gene-partial-overlaps.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";


$k = 0;


close(MYOUTFILE);



}

#criteria 5 for coordinate match. Boolean operation 5


if($entry1 eq $entry10 && $entry2 > $entry11 && $entry12 > $entry2 && $entry12 <= $entry3 && $entry4 eq $entry13 && $entry5 eq $entry14) {


$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">same-gene-strand-same-gene-partial-overlaps.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>same-gene-strand-same-gene-partial-overlaps.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";


$k = 0;


close(MYOUTFILE);



}


#criteria 6 for coordinate match. Boolean operation 6

if($entry1 eq $entry10 && $entry11 > $entry2 && $entry2 > $entry12 && $entry3 <= $entry12 && $entry4 eq $entry13 && $entry5 eq $entry14) {


$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">same-gene-strand-same-gene-partial-overlaps.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>same-gene-strand-same-gene-partial-overlaps.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";


$k = 0;


close(MYOUTFILE);



}

#same-genes-same-strand-genes-within

if($entry1 eq $entry10 && $entry2 > $entry11 && $entry3 < $entry12 && $entry4 eq $entry13 && $entry5 eq $entry14) {


$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">same-gene-strand-same-gene-annotations.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>same-gene-strand-same-gene-annotations.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";

$k = 0;


close(MYOUTFILE);



}

#criteria 2 for coordinate match. Boolean operation 2

if($entry1 eq $entry10 && $entry11 > $entry2 && $entry12 < $entry3 && $entry4 eq $entry13 && $entry5 eq $entry14) {



$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">same-gene-strand-same-gene-annotations.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>same-gene-strand-same-gene-annotations.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";

$k = 0;


close(MYOUTFILE);

}

#same-genes-different-strand-partial-overlaps-all
if($entry1 eq $entry10 && $entry2 < $entry11 && $entry3 > $entry11 && $entry3 <= $entry12 && $entry4 != $entry13 && $entry5 eq $entry14) {


$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">same-gene-strand-specific-gene-partial-overlaps.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>same-gene-strand-specific-gene-partial-overlaps.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";


$k = 0;


close(MYOUTFILE);



}

#criteria 4 for coordinate match. Boolean operation 4

if($entry1 eq $entry10 && $entry11 < $entry2 && $entry11 > $entry3 && $entry12 <= $entry3 && $entry4 != $entry13 && $entry5 eq $entry14) {


$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">same-gene-strand-specific-gene-partial-overlaps.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>same-gene-strand-specific-gene-partial-overlaps.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";


$k = 0;


close(MYOUTFILE);



}

#criteria 5 for coordinate match. Boolean operation 5


if($entry1 eq $entry10 && $entry2 > $entry11 && $entry12 > $entry2 && $entry12 <= $entry3 && $entry4 != $entry13 && $entry5 eq $entry14) {


$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">same-gene-strand-specific-gene-partial-overlaps.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>same-gene-strand-specific-gene-partial-overlaps.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";


$k = 0;


close(MYOUTFILE);



}


#criteria 6 for coordinate match. Boolean operation 6

if($entry1 eq $entry10 && $entry11 > $entry2 && $entry2 > $entry12 && $entry3 <= $entry12 && $entry4 != $entry13 && $entry5 eq $entry14) {


$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">same-gene-strand-specific-gene-partial-overlaps.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>same-gene-strand-specific-gene-partial-overlaps.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";


$k = 0;


close(MYOUTFILE);



}

#same-genes-different-strand-genes-within

if($entry1 eq $entry10 && $entry2 > $entry11 && $entry3 < $entry12 && $entry4 != $entry13 && $entry5 eq $entry14) {


$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">same-gene-strand-specific-gene-annotations.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>same-gene-strand-specific-gene-annotations.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";

$k = 0;


close(MYOUTFILE);



}

#criteria 2 for coordinate match. Boolean operation 2

if($entry1 eq $entry10 && $entry11 > $entry2 && $entry12 < $entry3 && $entry4 != $entry13 && $entry5 eq $entry14) {



$append = 0;
if ($append)
 {
 open(MYOUTFILE, ">same-gene-strand-specific-gene-annotations.txt"); #open for write, overwrite
 }
else
 {
 open(MYOUTFILE, ">>same-gene-strand-specific-gene-annotations.txt"); #open for write, append
 }
print MYOUTFILE $entry1, "\t", $entry2, "\t", $entry3, "\t", $entry4, "\t", $entry5, "\t", $entry6, "\t", $entry10, "\t", $entry11,"\t", $entry12,"\t", $entry13, "\t", $entry14, "\t", $entry15, "\n";

$k = 0;


close(MYOUTFILE);

}






}

}
