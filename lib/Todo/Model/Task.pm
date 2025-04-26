use warnings FATAL => 'all';
use strict;

package Todo::Model::Task;

use Moo;
use Params::Validate qw(:all);

has 'id' => (is => 'rw', required => 1);
has name => (is => 'rw', required => 1);
has status => (is => 'rw', required => 1);
has description => (is => 'rw', required => 1);

1;