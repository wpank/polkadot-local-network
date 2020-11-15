#!/bin/bash

# The following:
# - withdraws unbonded funds for Charlie

set -e
set -o pipefail

echo "Withdrawing unbonded..."
docker run --network=host jacogr/polkadot-js-tools api tx.staking.withdrawUnbonded --seed "//Charlie"  5 > /dev/null
echo "Done"
