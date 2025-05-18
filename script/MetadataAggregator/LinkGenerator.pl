#!/usr/bin/env perl
use strict;
use warnings;
use File::Find;
use TOML::Tiny;

use File::Path qw(make_path);
use Imager::QRCode;

use Cwd qw(realpath);
use FindBin qw($Dir);
use lib realpath("$Dir/../../lib"/MetadataAggregator);

use MetadataAggregator::Model::Pattern;

# === Configuration ===
my $input_dir  = "data/patterns";     # directory with JSON files
my $output_dir = "static/qr";         # output directory for PNGs
my $base_url   = "https://patterns.sddevelopment.be/";  # base for full URL if slug used

make_path($output_dir);

find(
    sub {
        return unless -f $_ && $_ =~ /\.md$/;

        my $file = $File::Find::name;

        open my $fh, '<', $file or do { warn "Could not open file '$file' $!" };
        my $file_content = do { local $/; <$fh> };
        close $fh;

        my $file_meta = $file_content->extract_metadata;

        say "Processing file: $file";
        say "  - Metadata: ", $file_meta->{name} // 'No name found';

    });


