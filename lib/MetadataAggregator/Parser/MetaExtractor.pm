package MetadataAggregator::Parser::MetaExtractor;
use strict;
use warnings FATAL => 'all';


use TOML::Tiny qw(from_toml to_toml);
use Log::Log4perl qw(:easy);
Log::Log4perl->easy_init($INFO);

sub extract_metadata {
    my @lines = @_;

    INFO "Extracting metadata from TOML frontmatter.";
    INFO "Lines: ", scalar @lines;

    # === Extract TOML frontmatter ===
    my $start = -1;
    my $end   = -1;
    for my $i (0 .. $#lines) {
        if ($lines[$i] =~ /^\+\+\+\s*$/) {
            if ($start == -1) {
                $start = $i;
            } else {
                $end = $i;
                last;
            }
        }
    }

    if ($start == -1 || $end == -1 || $end <= $start + 1) {
        ERROR "No valid TOML frontmatter found in provided data";
        return;
    }

    DEBUG "TOML frontmatter from $start until $end";
    my $toml_text = join('\n', @lines[$start .. $end]);

    my $length = length($toml_text);
    DEBUG "TOML frontmatter: ${length} characters";

    my ($meta, $errors) = TOML::Tiny::from_toml($toml_text);
    if(defined $errors && $errors ne '') {
        ERROR "Error parsing TOML: $errors";
        return;
    }

    return $meta;
}

1;