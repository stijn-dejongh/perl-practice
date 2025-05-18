package MetadataAggregator::Parser::MetaExtractor;
use strict;
use warnings FATAL => 'all';

use Params::Validate qw(:all);
use TOML::Tiny qw(from_toml to_toml);
use Log::Log4perl qw(:easy);

use Cwd qw(realpath);
use FindBin qw($Dir);
use lib realpath("$Dir/../Model");

Log::Log4perl->easy_init($INFO);

sub extract_metadata {
    my $p = validate(
        @_, { data_lines => 1 }
    );

    INFO "Extracting metadata from TOML frontmatter.";
    DEBUG "Data lines: ", $p->{data_lines};

    my ($toml_data) = $p->{data_lines} =~ m/^\+\+\+\n(.*?)\+\+\+/ms;

    if (length($toml_data) == 0) {
        ERROR "No valid TOML frontmatter found in provided data" and die;
    }
    my ($meta, $errors) = TOML::Tiny::from_toml($toml_data);
    die "Error parsing TOML: $errors" if $errors and $errors ne '';
    die "No metadata found in TOML frontmatter" unless defined $meta;

    return $meta;
}

sub to_pattern {
    my $p = validate(
        @_, { data_lines => 1 }
    );

    INFO "Converting metadata to Pattern object.";
    DEBUG "Data lines: ", $p->{data_lines};

    my $meta = extract_metadata(data_lines => $p->{data_lines});

    my $pattern = MetadataAggregator::Model::Pattern->new(
        id       => $meta->{id},
        name     => $meta->{name},
        url      => $meta->{url},
        category => $meta->{category},
        tags     => $meta->{tags} // [],
    );

    return $pattern;
}

1;