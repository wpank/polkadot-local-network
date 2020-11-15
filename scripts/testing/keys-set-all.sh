#!/bin/bash

# The following:
# - bonds stash/controller
# - creates session keys
# - sets all session keys

set -e
set -o pipefail

echo "Bonding stash account...."
docker run --network=host jacogr/polkadot-js-tools api tx.staking.bond --seed "//Charlie" 5FLSigC9HGRKVhB9FiEo4Y3koPsNmBmLJbpXg2mp1hXcS59Y 1000000000000000 Staked >/dev/null
echo "Done"

echo "Creating Session Keys....."
SESSION_KEY=$(curl -s  -H "Content-Type: application/json" -d '{"id":1, "jsonrpc":"2.0", "method": "author_rotateKeys", "params":[]}' http://localhost:9933 | jq '.["result"]') 
echo "Done"

echo '------------------------------------------------------------------------------------------------'
echo 'Session Keys: '$SESSION_KEY

echo '------------------------------------------------------------------------------------------------'
echo 'ImOnline Session Key:'
IMONLINE=$(docker container exec -it staking-ops-tools_node_charlie_1 ls /data/chains/local_testnet/keystore/ -rt | grep -m 1 '^69')
echo 'Public Key: ' ${IMONLINE:8} 
IMONLINE_MNEMONIC=$(docker container exec -it staking-ops-tools_node_charlie_1 cat /data/chains/local_testnet/keystore/${IMONLINE::-1})
echo 'Mnemonic: '$IMONLINE_MNEMONIC
echo '------------------------------------------------------------------------------------------------'

echo 'Grandpa Session Key:'
GRANDPA=$(docker container exec -it staking-ops-tools_node_charlie_1 ls /data/chains/local_testnet/keystore/ -rt | grep -m 1 '^67')
echo 'Public Key: ' ${GRANDPA:8} 
GRANDPA_MNEMONIC=$(docker container exec -it staking-ops-tools_node_charlie_1 cat /data/chains/local_testnet/keystore/${GRANDPA::-1})
echo 'Mnemonic: '$GRANDPA_MNEMONIC
echo '------------------------------------------------------------------------------------------------'

echo 'Babe Session Key:'
BABE=$(docker container exec -it staking-ops-tools_node_charlie_1 ls /data/chains/local_testnet/keystore/ -rt | grep -m 1 '^62')
echo 'Public Key: ' ${BABE:8} 
BABE_MNEMONIC=$(docker container exec -it staking-ops-tools_node_charlie_1 cat /data/chains/local_testnet/keystore/${BABE::-1})
echo 'Mnemonic: '$BABE_MNEMONIC
echo '------------------------------------------------------------------------------------------------'

echo 'Authority Discovery Session Key:'
AUDI=$(docker container exec -it staking-ops-tools_node_charlie_1 ls /data/chains/local_testnet/keystore/ -rt | grep -m 1 '^61')
echo 'Public Key: ' ${AUDI:8} 
AUDI_MNEMONIC=$(docker container exec -it staking-ops-tools_node_charlie_1 cat /data/chains/local_testnet/keystore/${AUDI::-1})
echo 'Mnemonic: '$AUDI_MNEMONIC
echo '------------------------------------------------------------------------------------------------'

echo 'Parachain ID Session Key:'
PARA=$(docker container exec -it staking-ops-tools_node_charlie_1 ls /data/chains/local_testnet/keystore/ -rt | grep -m 1 '^70')
echo 'Public Key: ' ${PARA:8} 
PARA_MNEMONIC=$(docker container exec -it staking-ops-tools_node_charlie_1 cat /data/chains/local_testnet/keystore/${PARA::-1})
echo 'Mnemonic: '$PARA_MNEMONIC
echo '------------------------------------------------------------------------------------------------'

echo "Setting Session Keys on chain....."
docker run --network=host jacogr/polkadot-js-tools api tx.session.setKeys --seed "//Charlie" $SESSION_KEY 0x >/dev/null
echo "Done"

echo "Submitting Validate tx......"
docker run --network=host jacogr/polkadot-js-tools api tx.staking.validate --seed "//Charlie" '0x10' >/dev/null
echo "Done"