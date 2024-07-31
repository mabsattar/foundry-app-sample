#!/bin/bash

# Set up environment variables
export NODE_URL="http://127.0.0.1:8545" # URL of your local node
export PRIVATE_KEY="0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80" # Private key of the deployer account
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
