#!/bin/bash

# Set up environment variables
export NODE_URL=http://127.0.0.1:8545 # URL of your local node
export PRIVATE_KEY=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 # Private key of the deployer account

# Check if environment variables are set
echo "NODE_URL: $NODE_URL"
echo "PRIVATE_KEY: $PRIVATE_KEY"

# Compile the contract
forge build

# Deploy the contract
forge create --rpc-url $NODE_URL --private-key $PRIVATE_KEY path/to/YourContract.sol:YourContract
