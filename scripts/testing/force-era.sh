#!/bin/bash

# The following:
# - Forces new eras

set -e
set -o pipefail

echo "Forcing new era...."
docker run --network=host jacogr/polkadot-js-tools api tx.staking.forceNewEraAlways --seed "//Alice"  --sudo >/dev/null
echo "Done"