#!/bin/bash


BABE=$(docker container exec -it staking-ops-tools_node_charlie_1 ls /data/chains/local_testnet/keystore/ -rt | grep -m 1 '^62')

echo 'Public Key: ' ${BABE:8} 
BABE_MNEMONIC=$(docker container exec -it staking-ops-tools_node_charlie_1 cat /data/chains/local_testnet/keystore/${BABE::-1})
echo 'Mnemonic: '$BABE_MNEMONIC

echo "Removing Babe Keys...."
docker container exec -it staking-ops-tools_node_charlie_1 rm /data/chains/local_testnet/keystore/${BABE::-1}
echo "Done"