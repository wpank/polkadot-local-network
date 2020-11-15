#!/bin/bash

# The following:
# - unbonds funds for Charlie

set -e
set -o pipefail

echo "Unbonding stash account...."
docker run --network=host jacogr/polkadot-js-tools api tx.staking.unbond --seed "//Charlie"  500000000000000 > /dev/null
echo "Done"
