#!/bin/bash

# The following:
# - Pays out Charlie for the first era

set -e
set -o pipefail

echo "Claiming rewards...."
docker run --network=host jacogr/polkadot-js-tools api tx.staking.payoutStakers --seed "//Charlie" "5HpG9w8EBLe5XCrbczpwq5TSXvedjrBGCwqxK1iQ7qUsSWFc" 1  > /dev/null
echo "Done"
