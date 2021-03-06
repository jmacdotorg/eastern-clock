# Eastern Clock — a Twitter sculpture

This repository contains the code behind “Eastern Clock”, a Twitter-based sculpture by Jason McIntosh (jmac@jmac.org).

You can view the work here: [@EasternClock](http://twitter.com/EasternClock).

## Invoking it

Its heart is the Perl script `eastern_clock.pl`. In practice, this is called once per minute as a crontask, which invokes it with more or less this syntax:

> /path/to/eastern_clock.pl --config=/path/to/eastern_clock.config

The referenced config file must contain four Twitter API keys and access tokens, as illustrated in the included file `eastern_clock.config-dist`.

## Prerequisites

This script requires Perl, as well as the following Perl modules, all of which may be easily had via CPAN:

* [Net::Twitter](https://metacpan.org/pod/Net::Twitter) (version 4.01007 or later)
* [DateTime::Moonpig](https://metacpan.org/pod/DateTime::Moonpig)
* [Config::Tiny](https://metacpan.org/pod/Config::Tiny)
* [Getopt::Mini](https://metacpan.org/pod/Getopt::Mini)
* [Readonly](https://metacpan.org/pod/Readonly)

You’ll also need a set of valid Twitter API keys and access tokens to plug into the config file. The script requires write-access to the account whose tokens you hand it. 

## A word of caution

Since the script deletes as many as 20 tweets from the account to which it has access every time it's run, you probably don't want to give it tokens for your personal Twitter account.

## Credits

This software is copyright &copy; 2014 by Jason McIntosh. Permission is hereby granted to copy or modify this software for your own use.

