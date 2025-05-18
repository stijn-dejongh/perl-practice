package MetadataAggregator::Pattern;
use strict;
use warnings FATAL => 'all';

use Moo;
use Params::Validate qw(:all);

has 'id' => (is => 'rw', required => 1);
has name => (is => 'rw', required => 1);
has 'url' => (is => 'rw', required => 1);

has 'category' => (is => 'rw', required => 1);
has 'tags' => (is => 'rw', required => 1), default => sub { [] };


1;