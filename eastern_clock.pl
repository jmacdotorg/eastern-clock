#!/usr/bin/env perl

use warnings;
use strict;

use Net::Twitter;
use DateTime::Moonpig;
use Config::Tiny;
use Getopt::Mini;

use Readonly;
Readonly my $TIME_ZONE => 'local';

my $config_file = $ARGV{ config } or die "Usage: $0 --config=path/to/config.file\n";
my $twitter_config = Config::Tiny->read( $config_file )
    or die "$Config::Tiny::errstr\n";


my $twitter = Net::Twitter->new(
    traits   => [qw/API::RESTv1_1/],
    ssl => 1,
    %{ $twitter_config->{ _ } },
);

# Delete all extant tweets. (This should be only one tweet, at any given time, but one
# never can be too careful.)
my $old_tweets_ref = $twitter->user_timeline;
for my $old_tweet ( @$old_tweets_ref ) {
    $twitter->destroy_status( $old_tweet->{ id } );
}

# Post the current time as a tweet.
my $now = DateTime::Moonpig->now( time_zone => $TIME_ZONE );
my $tweet_text = $now->strftime( 'It is now %I:%M %p on %A, %B %d, %Y (Eastern time).' );
$twitter->update( $tweet_text );

