#!/bin/bash

# The following:
# - Sets the controller of Charlie to Dave

set -e
set -o pipefail

echo "Setting Controller...."
docker run --network=host jacogr/polkadot-js-tools api tx.staking.setController --seed "//Charlie" 5DAAnrj7VHTznn2AWBemMuyBwZWs6FNFjdyVXUeYum3PTXFy > /dev/null
echo "Done"
