# $Id: 01-extract.t 1816 2005-03-16 22:56:37Z btrott $

use strict;
use Test::More tests => 6;
use WWW::Blog::Metadata;

my $meta;

$meta = WWW::Blog::Metadata->extract_from_uri('http://btrott.typepad.com/')
    or die WWW::Blog::Metadata->errstr;
is($meta->foaf_icon_uri, 'http://btrott.typepad.com/ben-vienna.jpg');
is($meta->icon_uri, 'http://btrott.typepad.com/ben-vienna.jpg');
ok(!$meta->favicon_uri);

$meta = WWW::Blog::Metadata->extract_from_uri('http://overstated.net/')
    or die WWW::Blog::Metadata->errstr;
is($meta->favicon_uri, 'http://overstated.net/favicon.ico');
is($meta->icon_uri, 'http://overstated.net/favicon.ico');
ok(!$meta->foaf_icon_uri);
