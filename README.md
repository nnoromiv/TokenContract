# YourToken Smart Contract & Faucet

## Overview

The YourToken Smart Contract is an ERC-20 token implementation in Solidity. It extends the OpenZeppelin `Ownable` contract for ownership control and implements the standard ERC-20 interface with additional functionalities.

The Faucet Smart Contract is a simple Solidity contract that acts as a token dispenser, allowing users to request a fixed amount of tokens at regular intervals. It is designed to work with an ERC-20 token contract (referenced as `YourToken.sol`) and extends the `Ownable` contract from the OpenZeppelin library for ownership control.

## Features

- ERC-20 compliant token with basic functionalities (transfer, balance inquiry, approval, and transferFrom).
- Implements the `Ownable` contract for ownership control.
- Customizable token details such as name, symbol, and decimals.

- Users can request tokens from the faucet with a cool down period.
- The faucet balance is checked before transferring tokens.
- The owner can set cool down periods for specific addresses.

## Token Details

Replace the following with yours

- **Name:** YourToken
- **Symbol:** yTK
- **Decimals:** 18
- **Total Supply:** 1,100,000 tokens

## Prerequisites

- Solidity Compiler version 0.8.19 or compatible.
- OpenZeppelin Contracts library.
- ERC-20 token contract (`YourToken.sol`) -- For the Faucet.

## Setup

1. Deploy the `YourToken` contract.
2. Deploy the `Faucet` contract, passing the address of the deployed `YourToken` contract as a parameter.
3. Set initial token balances as needed.

## Contract Details

- `YourToken` is an ERC-20 token contract that follows the OpenZeppelin standard.
- `YourToken public existingTokenContract;`: Public variable representing the ERC-20 token contract.
- `uint256 public requestCoolDown = 15 minutes;`: Cool Down period for requesting tokens set to 15 minutes.
- `uint256 public faucetBalance;`: Current balance of the faucet.
- `mapping(address => uint256) public lastRequestTimestamp;`: Mapping to track the timestamp of the last token request for each address.
- `mapping(address => uint256) private _balances;`: Private mapping for storing balances (currently not used).

## Functions

### *YourToken*

### `name()`

- Returns the name of the token.

### `symbol()`

- Returns the symbol of the token.

### `decimals()`

- Returns the number of decimals used by the token.

### `totalSupply()`

- Returns the total supply of the token.

### `balanceOf(address account)`

- Returns the balance of the specified account.

### `transfer(address recipient, uint256 amount)`

- Transfers a specified amount of tokens to the recipient.

### `allowance(address owner, address spender)`

- Returns the remaining allowance that a spender has to transfer tokens from a specific owner.

### `approve(address spender, uint256 amount)`

- Approves a spender to spend a specified amount of tokens on behalf of the owner.

### `transferFrom(address sender, address recipient, uint256 amount)`

- Transfers a specified amount of tokens from one address to another.

### *Faucet*

### `constructor(address _existingTokenAddress)`

- Initializes the contract with the address of an existing ERC-20 token.
- Sets the initial balance of the faucet.

### `function requestTokens() external`

- Allows users to request tokens if the cool down has elapsed and the faucet balance is sufficient.

### `function setCoolDownForAddress(address user, uint256 cool down) external onlyOwner`

- Allows the owner to set the cool down for a specific address.

### `function getCoolDownForAddress(address user) public view returns (uint256)`

- Retrieves the remaining cool down for a specific address.  

## Ownership Control

- The contract uses the `Ownable` contract to ensure that certain functions can only be executed by the contract owner.

## Usage

1. Deploy the `YourToken` and `Faucet` contracts.
2. Interact with the contract using the provided functions.
3. Ensure proper ownership control for critical functions.
4. Ensure that users comply with the specified cool down period.

## License

This smart contract is released under the MIT License. See the [LICENSE](./LICENSE) file for details.
