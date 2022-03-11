#!/usr/bin/perl
use strict;
use warnings;
use experimental qw< signatures >;

my @input = (
    '# Godfather (intro)',
    '2:9>1:9>1:12>1:11>1:9>1:12>1:9>1:11>1:9>2:10>2:12>2:9>>2:9>1:9>1:12>1:11>1:9>1:12>1:9>1:11>1:9>2:9>2:8>2:7',

    '# Mama Said',
    '1:1+4:0>2:3>3:2>1:1>2:3>3:2>1:3+4:0>2:3>3:2>1:1+4:0>2:3>3:2',
);

our @STRUCT;

foreach my $input (@input) {
    if ( $input =~ /^\#\s*(.*)$/xms ) {
        print "$1\n";
        next;
    }

    my @parts = split />/xms, $input;
    add_column(
        'E|',
        'A|',
        'D|',
        'G|',
        'B|',
        'E|',
    );

    # 1:2
    # 1:3+3:2+4:5+6:9
    foreach my $part (@parts) {
        if (!$part) {
            add_column( map '-', 1 .. 6 );
            next;
        }

        my @note_pairs = split /\+/xms, $part;
        my %notes;

        foreach my $note_pair (@note_pairs) {
            my ( $string, $note ) = split /:/xms, $note_pair;
            $notes{$string} = $note;
        }

        my $max_length = ( sort { $b <=> $a } map length, values %notes )[0];

        my @rows_to_add;
        foreach my $string ( 1 .. 6 ) {
            my $note = $notes{$string} // '-' x $max_length;
            push @rows_to_add, $note;
        }

        add_column( map '-', 1 .. 6 );
        add_column(@rows_to_add);
        add_column( map '-', 1 .. 6 );
    }

    print_struct();
    print "\n";

    @STRUCT = ();
}


sub print_struct {
    foreach my $row_idx ( 0 .. $#STRUCT ) {
        print join '', $STRUCT[$row_idx]->@*;
        print "\n";
    }
}

# TODO: Check that all rows have the same length before
sub add_column (@rows) {
    my $idx_to_add = $#{ $STRUCT[0] } + 1;

    my $length;
    foreach my $row_idx ( 0 .. $#rows ) {
        my $row = $rows[$row_idx];
        defined $row or die 'Row undefined!';

        $length //= length $row;
        length $row == $length
            or die "Asked to add a row (idx: $idx_to_add) with different length than other row!";

        $STRUCT[$row_idx][$idx_to_add] = $row;
    }
}
