#!/bin/bash

# The following:
# - Sets the reward destination to Stash (doesn't get re-staked)

set -e
set -o pipefail

echo "Setting Payee...."
docker run --network=host jacogr/polkadot-js-tools api tx.staking.setPayee --seed "//Charlie" Stash > /dev/null
echo "Done"
