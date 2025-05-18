#!/usr/bin/perl
use warnings;
use Test::More;

use Cwd qw(realpath);
use FindBin qw($Dir);

use lib realpath("$Dir/../../../lib");

print "Running tests for Todo::Model::Task...\n";

use Todo::Model::Task;

use_ok(Todo::Model::Task, 'Task model library is loadable');

subtest task_creation => sub {
    my $task = Todo::Model::Task->new(
        id          => 1,
        name        => 'Test Task',
        status      => 'pending',
        description => 'This is a test task.'
    );

    is($task->id, 1, 'ID is set correctly');
    is($task->name, 'Test Task', 'Name is set correctly');
    is($task->status, 'pending', 'Status is set correctly');
    is($task->description, 'This is a test task.', 'Description is set correctly');
};

done_testing();

