#!/bin/bash
set -e

echo 'Updating Ethereum. This may take a minute.'
supervisorctl stop ethereum
echo 'Downloading...'
curl -#o ethereum.tar.gz https://gethstore.blob.core.windows.net/builds/geth-linux-amd64-1.8.1-1e67410e.tar.gz
tar -xzf /tmp/ethereum.tar.gz -C /tmp/
echo 'Updating...'
mv /usr/local/bin/geth /usr/local/bin/geth-old
cp geth-linux-amd64-1.8.1-1e67410e/geth /usr/local/bin/geth
rm -r /tmp/geth-linux-amd64-1.8.1-1e67410e
rm /tmp/ethereum.tar.gz
supervisorctl start ethereum
echo 'Ethereum is updated.'