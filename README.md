# chsec

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with chsec](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with chsec](#beginning-with-chsec)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This is the chsec module. It is a fork of bwilcox-chsec, in order to release fixes.

It's purpose in life is to manage attribute files in a
specific format on AIX servers using the proper AIX commands:

* lssec
* chsec

The list of files that this module can edit is found in the
aix manpage for chsec. An example of one of these files is
/etc/security/user.

It probably has no bearing at all for any other OS out there.

This module is ensurable.  It will check the given properties and change
them as specified if they deviate from the expected value.

## Setup

### Setup Requirements

Add the module to your modules path and let pluginsync do the rest.

### Beginning with chsec

chsec takes the following parameters:

* attribute: This is the name of the attribute, ie. "minage" in /etc/security/user.
* value: This is the value the attribute should be set to.
* file: This is the file that the attribute lives in.
* stanza:  This is the stanza the value should be set for.

## Usage

`chsec { "default_minage":
  ensure    => present,
  attribute => 'minage',
  value     => '2',
  file      => '/etc/security/user',
  stanza    => 'default'
}`

This will check the 'minage' attribue of the 'default' stanza in the '/etc/security/user'
file and if it is not present or not set to '2', change it to be '2'.

Because it is ensurable, setting ensure to 'absent' in this example would check for
the presence of 'minage' in the 'default' stanza of '/etc/security/user' and remove it
if found.


## Reference

### Public Type

* chsec

### Parameters

* attribute: This is the thing to change, ie. "minage" in /etc/security/user.
* value: This is the value the attribute should be set to.
* file: This is the file that the attribute lives in.
* stanza:  This is the stanza the value should be set for.

## Limitations

This was written for AIX.  Other OS' have other ways to do the same thing, I wanted
one that worked with AIX's standard commands for manipulating entries in security
files. This should work for any file that the AIX 'chsec' command will work with.
See the AIX 'chsec' man page for a listing.

This version has been deployed on PE 2015.3.3.  An internally produced version ran on
3.7, but was never released to the forge.  This version hasn't been tested on the older
Puppet releases.

## Development

If you've got a better way to do things, please feel free to make merge requests.

## Release Notes/Contributors/Etc

I hope someone else out there finds this useful.
