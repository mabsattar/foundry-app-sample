#!/bin/bash

# Load environment variables from .env file
set -o allexport
source .env
set +o allexport

# Set up environment variables
export NODE_URL="${NODE_URL}" # URL of your local node
export PRIVATE_KEY="${PRIVATE_KEY}" # Private key of the deployer account
export GREETING="Hello, World!" # Example constructor argument

# Diagnostic output to verify variables
echo "Using RPC URL: $NODE_URL"
echo "Using Private Key: $PRIVATE_KEY"
echo "Using Greeting: $GREETING"

# Verify connection to local node
echo "Checking connection to local node..."
curl -X POST "$NODE_URL" -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}'

# Compile the contract
forge build

# Deploy the contract with constructor arguments
forge create --rpc-url "$NODE_URL" --private-key "$PRIVATE_KEY" src/Greeter.sol:Greeter --constructor-args "$GREETING"
