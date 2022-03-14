#!/usr/bin/perl
use strict;
use warnings;
use experimental qw< signatures >;
use Getopt::Long qw< :config no_ignore_case >;

sub render (@input) {
    foreach my $input (@input) {
        my @stave;

        if ( $input =~ /^\#\s*(.*)$/xms ) {
            print "$1\n";
            next;
        }

        my @parts = split />/xms, $input;
        add_column(
            \@stave,
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
                add_column( \@stave, map '-', 1 .. 6 );
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

            add_column( \@stave, map '-', 1 .. 6 );
            add_column( \@stave, @rows_to_add);
            add_column( \@stave, map '-', 1 .. 6 );
        }

        print_stave(@stave);
        print "\n";
    }
}

sub print_stave (@stave) {
    foreach my $row_idx ( 0 .. $#stave ) {
        print join '', $stave[$row_idx]->@*;
        print "\n";
    }
}

# TODO: Check that all rows have the same length before
sub add_column ( $staveref, @rows) {
    my $idx_to_add = $#{ $staveref->[0] } + 1;

    my $length;
    foreach my $row_idx ( 0 .. $#rows ) {
        my $row = $rows[$row_idx];
        defined $row or die 'Row undefined!';

        $length //= length $row;
        length $row == $length
            or die "Asked to add a row (idx: $idx_to_add) with different length than other row!";

        $staveref->[$row_idx][$idx_to_add] = $row;
    }
}

sub print_help {
    print <<~ "EOS";
    $0 '...'

    Converts from Sawyer's guitar notation to regular tabs

    OPTIONS:

    --help | -h     Print this help menu

    SYNTAX:

    1:3             - 1st string, 3rd position
    1:3>2:2         - 1st string, 3rd position, then 2nd string, 2st position
    1:3>>2:2        - same as above, but with extra space in between
    # Song name...  - Header above the notes listing
    1:3+4:2         - Combination of notes at the same time
    2h3             - Hammer on from 2 to 3
    3p2             - Pull-off from 3 to 2
    1:3v            - Vibrate on 3rd position in 1st string
    1:3~            - Same as above, alternative syntax
    / or \\          - slide up or down, respectively
    EOS

    exit 0;
}

my $input;
GetOptions(
    'help|h' => sub { print_help(); },
    '<>'     => sub { $input = shift },
);

$input
    or print_help();

render($input);
