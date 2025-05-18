#!/usr/bin/perl
use warnings;
use Test::More;

use Cwd qw(realpath);
use FindBin qw($Dir);
use lib realpath("$Dir/../../lib");

use_ok(MetadataAggregator::Parser::MetaExtractor, 'MetadataAggregator::Parser::MetaExtractor library is loadable');

my @data_lines = <DATA>;

is(@data_lines, '58',  "Raw data has length 57");

my $metadata = MetadataAggregator::Parser::MetaExtractor::extract_metadata(<DATA>);
# is($metadata->{title}, 'Impact-Oriented Communication',  "Metadata title is read correctly");



done_testing();

__DATA__
+++
title = "Impact-Oriented Communication"
subtitle = "Quantify your story, increase your clarity"
author = "Stijn Dejongh"
problem = "Technical professionals often describe tasks, tools, or deliverables without articulating the outcome."
description = "Avoid invisibility by describing your work in terms of measurable outcomes that align with team and organisational goals."
summary = """
Many technical professionals downplay their contributions or describe them in purely technical terms. This practice strengthens agility, clarity, and problem-solving through repeatable communication habits. It promotes visibility without ego, outcome framing without rigidity, and measurement without dogma. Its strongest contribution lies in making value legible and learning visible, especially when paired with a healthy team culture.
    """
categories = [
    "communication"
]
tags = [
    "outcomes", "communication", "visibility", "measurement", "feedback", "quantification"
]
uuid="81733c4f-a952-47d2-a678-900956ac728d"
aliases=["81733c4f-a952-47d2-a678-900956ac728d"]
outputs = ["html", "json"]
ammerse = [
    {name = "agile", delta = "0.6", rationale = "Supports adaptability by reinforcing visibility, iteration, and feedback-oriented phrasing."},
    {name = "minimal", delta = "0.35", rationale = "Reduces noise and ambiguity by offering a concise communication template."},
    {name = "maintainable", delta = "0.15", rationale = "Promotes sustainable habits, especially when the team buys into the format."},
    {name = "environmental", delta = "0.3", rationale = "Helps bridge cross-functional and interpersonal gaps by making value legible."},
    {name = "reachable", delta = "0", rationale = "Entry is relatively low-friction, though some discomfort remains for newcomers or less measurable work."},
    {name = "solvable", delta = "1", rationale = "Highest scoring dimension. The practice materially improves problem framing, decision clarity, and learning."},
    {name = "extensible", delta = "0", rationale = "Offers modest reuse across contexts, but doesn’t inherently scale without adaptation."}
]
related_concepts = [
    "b86230c6-49fb-4792-9008-a5241c5cdcb2",
    "c57288e3-b102-4212-adb7-a4339a3a9e87",
    "cffb7fab-580e-4add-b807-d3a76b3209c7"
]
related_practices = [
    "8ffeb93b-0f8d-4b01-867b-a8b78ebd4644",
    "47f32286-17b0-471e-90d6-eb0de9f60ac0",
    "ad717858-fd38-491e-ba78-41d50314a353"
]
further_exploration = [
    {type="raw", author="Asplund, J.", year="2019", site="animalz.co", link="https://www.animalz.co/blog/bottom-line-up-front/", title="BLUF: The military standard that can make your writing more powerful"},
    {type="raw", author="Sehgal, K.", site="Harvard Business Review", title="How to write Email with military precision", year="2016", link="https://hbr.org/2016/11/how-to-write-email-with-military-precision"},
    {type="raw", author="Indeed Editorial Team", year="2025", site="indeed.com", link="https://www.indeed.com/career-advice/resumes-cover-letters/how-to-quantify-resume", title="How to quantify Resume Accomplishments"},
    {type="raw", author="Khan, T.", year="2025", site="ibm.com", link="https://www.ibm.com/think/topics/okrs", title="What are Objectives and Key Results (OKRs)?"},
    {type="biblio", id="06a5cfd2-0204-4199-966e-8a7a4847742a"},
    {type="biblio", id="f17079c7-1dc6-42de-85c1-f61dbeade355"},
    {type="biblio", id="b6da416a-00a2-46dd-a211-fb4d4f0382e3"},
    {type="biblio", id="93c3d298-690e-48b5-8140-b34ce90c2083"},
]
#image="practices/XXXX.webp"
pubdate="2025-05-18"
+++

## Problem statement

In many workplaces, communication focuses on *what was done*, not *why it mattered*.

Technical professionals often describe tasks, tools, or deliverables without articulating the outcome. As a result, the real value of their work goes unseen, misunderstood, or underleveraged. This limits alignment, recognition, and learning.

Whether in status updates, documentation, retrospectives, or evaluations, failing to lead with impact creates missed opportunities — for you and for your team.
