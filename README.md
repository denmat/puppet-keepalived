puppet-keepalived
=================

## keepalived for puppet:

This module is using puppet-data-module from [ripienaar](https://github.com/ripienaar/puppet-module-data) that allows you to do hiera lookups in a data directory attached to the module source code.

It requires that you modify your standard puppet and hiera code base and the ripienaar provides no real instructions on the best way this should be done.

The code in the current master branch is broken but there is a pull request that fixes this and makes it work nicely.

## instructions:

You need to checkout the puppet-module-data code or copy and paste from the source on github.

I've made a fork of [ripienaar](https://github.com/ripienaar/puppet-module-data) and pulled in the changes that makes it work with 3.x.

You can get that [here](https://github.com/denmat/puppet-module-data). I've included a rake task that will install the patches into an rvm environment.

You will need the following gems:
 - hiera-puppet-helper
 - hiera
 - puppet

See the Rakefile for where I stick the files.


### thanks to:
 - [ripienaar](https://github.com/ripienaar/puppet-module-data)
 - [dgoodlad](https://github.com/dgoodlad/puppet-module-data)
 - [wfarr](https://github.com/wfarr/puppet-module-data)
