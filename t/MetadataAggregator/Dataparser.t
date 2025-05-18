#!/usr/bin/perl
use warnings;
use Test::More;

use Cwd qw(realpath);
use FindBin qw($Dir);
use lib realpath("$Dir/../../lib");

use_ok(MetadataAggregator::Parser::MetaExtractor, 'MetadataAggregator::Parser::MetaExtractor library is loadable');

my $minimal_data = <<'EOF';
+++
title = "Impact-Oriented Communication"
subtitle = "Quantify your story, increase your clarity"
author = "Stijn Dejongh"
uuid="81733c4f-a952-47d2-a678-900956ac728d"
tags = ["testing", "perl"]
+++
EOF

is(length($minimal_data), '200',  "Raw data has length 200");

my $metadata = MetadataAggregator::Parser::MetaExtractor::extract_metadata(data_lines => $minimal_data);

is($metadata->{title}, 'Impact-Oriented Communication', 'Title is parsed correctly');
is($metadata->{subtitle}, 'Quantify your story, increase your clarity', 'Subtitle is parsed correctly');
is($metadata->{author}, 'Stijn Dejongh', 'Author is parsed correctly');
is($metadata->{uuid}, '81733c4f-a952-47d2-a678-900956ac728d', 'UUID is parsed correctly');

my $mixed_data = <<'EOF';
+++
title = "Experimental Markdown"
subtitle = "And some random linebreaks in the TOML frontmatter"
author = "Your name"


uuid="01JVJ021P48PK7TBHFQMPE65ZW"
tags = ["testing", "perl"]
+++

This is random content

# A markdown header

Here is some more content.
EOF

my $metadata_mixed = MetadataAggregator::Parser::MetaExtractor::extract_metadata(data_lines => $mixed_data);

is($metadata_mixed->{title}, 'Experimental Markdown', 'Title is parsed correctly');
is($metadata_mixed->{subtitle}, 'And some random linebreaks in the TOML frontmatter', 'Subtitle is parsed correctly');
is($metadata_mixed->{author}, 'Your name', 'Author is parsed correctly');
is($metadata_mixed->{uuid}, '01JVJ021P48PK7TBHFQMPE65ZW', 'UUID is parsed correctly');
is($metadata_mixed->{tags}->[0], 'testing', 'First tag is parsed correctly');

my $pattern = MetadataAggregator::Parser::MetaExtractor::to_pattern(data_lines => $mixed_data);

is($pattern->id, '01JVJ021P48PK7TBHFQMPE65ZW', 'ID is set correctly');
is($pattern->name, 'Experimental Markdown', 'Name is set correctly');

done_testing();

