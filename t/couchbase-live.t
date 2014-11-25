#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;

done_testing();

BEGIN {	
	if ( my $server = $ENV{COUCHBASE_TEST_SERVER} ) {
		require Catalyst::Plugin::Session::Test::Store;
		Catalyst::Plugin::Session::Test::Store->import(
			backend => 'Couchbase',
			config => {
				couchbase_server => $ENV{COUCHBASE_TEST_SERVER},
				couchbase_bucket => ( $ENV{COUCHBASE_TEST_BUCKET} or 'default' ),
			},
			extra_tests => 1
		);
	} else {
		plan( skip_all => "No live tests without COUCHBASE_TEST_SERVER variable" );
	}
}

1;
