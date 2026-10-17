#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use utf8;
use open ":std" => ':utf8';

if ($ARGV[0] =~ /--version/) {
    print "ATJS (Again Translator to Java Script)\nVersion 1.0\n";
    return 0;
} else {
    open my $in, "<", "$ARGV[0]" or die "cloud not be open file $ARGV[0] ERR: $!";
    open my $out, ">", "$ARGV[1]" or die "cloud not be open file $ARGV[1] ERR: $!";

    while (my $line = <$in>) {
        $line =~ s/\bprintlog\(\[\"(.*?)"\]\)/console.log("$1")/g;
        $line =~ s/\bcreate var (.*?) = (.*?)/var $1 = $2/g;
        $line =~ s/\bprintvar\(\[\:(.*?):\]\)/console.log($1)/g;
        $line =~ s/\bcreate func (.*?)\s*\{/function $1 {/g;
        $line =~ s/\b(\w+)\(\s*\[\s*(.*?)\s*\]\s*\)/$1($2)/g;

        print $out $line;
    }
    close($in);
    close($out);
}
