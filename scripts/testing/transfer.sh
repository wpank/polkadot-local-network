#!/bin/bash

set -e
set -o pipefail

echo "Sending a transfer from Charlie to Alice...."
docker run --network=host jacogr/polkadot-js-tools api tx.balances.transfer --seed "//Charlie"   5GrwvaEF5zXb26Fz9rcQpDWS57CtERHpNehXCPcNoHGKutQY 123456 > /dev/null
echo "Done"

