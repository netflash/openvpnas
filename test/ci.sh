#!/usr/bin/env bash
# unit test helper script

set -x
set -e
set -u
set -o pipefail

# run rspec tests if directory exists
if [ -d "spec" ] ; then
  rspec  --format documentation --color
fi

# run foodcritic static chef code analysis
# http://www.foodcritic.io/
foodcritic -f correctness,services,libraries,deprecated .

# run rubocop static ruby code analysis
# http://batsov.com/rubocop/
rubocop -Da .
