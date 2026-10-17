#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use utf8;
use open ":std" => ':utf8';

if (!defined $ARGV[0]) {
    die "syntax is 'atjs <input.atjs> <output.js> (or --version)'";
}
if ($ARGV[0] =~ /--version/) {
    print "ATJS (Again Translator to Java Script)\nVersion 1.0\n";
} else {
    open my $in, "<", "$ARGV[0]" or die "cloud not be open file $ARGV[0] ERR: $!";
    open my $out, ">", "$ARGV[1]" or die "cloud not be open file $ARGV[1] ERR: $!";

    while (my $line = <$in>) {
        $line =~ s/\bprintobj_var\(\s*\[\s*\.\s*(\w+)\s*\.?\s*\]\s*\)/console.log(this.$1)/g;
        $line =~ s/\bprintlog\(\[\"(.*?)"\]\)/console.log("$1")/g;
        $line =~ s/\bcreate var (.*?) = (.*?)/var $1 = $2/g;
        $line =~ s/\bprintvar\(\[\:(.*?):\]\)/console.log($1)/g;
        $line =~ s/\bcreate func (.*?)\s*\{/function $1 {/g;
        $line =~ s/\b(\w+)\(\s*\[\s*(.*?)\s*\]\s*\)/$1($2)/g;
        $line =~ s/\bloop (.*?)\s*\{/while $1 {/g;
        $line =~ s/\bif (.*?)\s*\{/if $1 {/g;
        $line =~ s/\bis val/===/g;
        $line =~ s{->}{}g;
        $line =~ s/\bcreate const (.*?) = (.*?)/const $1 = $2/g;
        $line =~ s/\bcreate Object (.*?)\s*\{/class $1 {/g;
        $line =~ s/\bcreate Object Val (.*?) with (.*?)/var $1 = new $2/g;
        $line =~ s/\bcreate object func (.*?) \{/$1 {/g;
        $line =~ s/\bcall from (.*?) func (.*?)/$1.$2/g;
        $line =~ s/\bcreate object var (.*?) = (.*?)/$1 = $2/g;
        $line =~ s/\bback (.*?)/return $1/g;

        print $out $line;
    }
    close($in);
    close($out);
}
