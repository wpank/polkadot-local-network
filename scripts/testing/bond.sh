#!/bin/bash

# The following:
# - bonds stash/controller for Charlie

set -e
set -o pipefail

echo "Bonding stash account...."
docker run --network=host jacogr/polkadot-js-tools api tx.staking.bond --seed "//Charlie" 5FLSigC9HGRKVhB9FiEo4Y3koPsNmBmLJbpXg2mp1hXcS59Y 1000000000000000 Staked > /dev/null
echo "Done"
