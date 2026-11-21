# Blockchain Projects – Voting System & SimpleStorage

This repository contains two beginner-friendly Solidity smart contract projects developed using **Solidity, Remix IDE, MetaMask, and Hardhat Local Network**.

The purpose of these projects is to understand how smart contracts work, how to deploy them on a blockchain, and how to interact with them through MetaMask and Remix.





# 1. Voting System


The Voting System is a blockchain-based voting smart contract that allows users to vote for candidates.

It uses Ethereum addresses to identify voters and ensures that each address can vote only once.

Features

- Three predefined candidates:
  - Candidate A
  - Candidate B
  - Candidate C
- One vote per wallet address.
- Prevents duplicate voting.
- Validates candidate IDs.
- Maintains vote counts on the blockchain.
- Emits an event whenever a vote is cast.
- Provides functions to retrieve candidate information and voting results.

Technologies Used

- Solidity
- Remix IDE
- MetaMask
- Hardhat Local Network
- HTML
- CSS
- JavaScript
- Ethers.js

#Smart Contract Functions

| Function | Description |
|---|---|
| `getCandidateCount()` | Returns the total number of candidates. |
| `getCandidate(id)` | Returns candidate ID, name, and vote count. |
| `getCandidates()` | Returns all candidates. |
| `hasVoted(address)` | Checks whether an address has voted. |
| `vote(candidateId)` | Casts a vote for a candidate. |

## How the Voting System Works

1. The contract is deployed to the blockchain.
2. Three candidates are automatically created through the constructor.
3. A user connects their MetaMask wallet.
4. The user selects a candidate.
5. The smart contract checks whether the wallet has already voted.
6. If the user has not voted, the vote count is increased.
7. The wallet address is marked as having voted.
8. The updated results can be retrieved from the contract.

### Important Solidity Logic

```solidity
mapping(address => bool) public voted;

function vote(uint256 candidateId) public {
    require(!voted[msg.sender], "You have already voted");

    require(
        candidateId > 0 && candidateId <= candidates.length,
        "Invalid candidate ID"
    );

    voted[msg.sender] = true;
    candidates[candidateId - 1].voteCount++;
}
```

The `mapping` stores whether a particular wallet address has already voted.

The `require()` statements prevent duplicate voting and invalid candidate selection.

## Deployment and Execution

1. Open [Remix IDE](https://remix.ethereum.org/).
2. Create a Solidity file named `Voting.sol`.
3. Write the Voting smart contract.
4. Compile the contract using a compatible Solidity compiler.
5. Start the local Hardhat node:

```bash
npx.cmd hardhat node
```

6. Keep the terminal running.
7. Add the Hardhat Local network to MetaMask:

| Setting | Value |
|---|---|
| Network Name | Hardhat Local |
| RPC URL | http://127.0.0.1:8545 |
| Chain ID | 31337 |
| Currency Symbol | ETH |

8. Import a Hardhat development account into MetaMask.
9. In Remix, select **Injected Provider / Browser Extension**.
10. Select the Voting contract and deploy it.
11. Confirm the deployment transaction in MetaMask.

## Testing

The following tests were performed:

- Successfully deployed the Voting contract.
- Retrieved the total number of candidates.
- Cast votes using different wallet accounts.
- Verified that a wallet could not vote twice.
- Tested invalid candidate IDs.
- Checked updated candidate vote counts.

Example results from testing:

| Candidate | Votes |
|---|---:|
| Candidate A | 1 |
| Candidate B | 1 |
| Candidate C | 0 |
| **Total** | **2** |

The contract rejected duplicate voting with the message:

`You have already voted`

It also rejected invalid candidate IDs with:

`Invalid candidate ID`

---

# 2. SimpleStorage

## Overview

SimpleStorage is a basic Solidity smart contract used to understand how data can be stored and modified on a blockchain.

The contract stores a single unsigned integer (`uint256`) and provides functions to update and retrieve its value.

## Technologies Used

- Solidity
- Remix IDE
- MetaMask
- Hardhat Local Network

## Smart Contract Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SimpleStorage {

    uint256 private number;

    constructor(uint256 initialNumber) {
        number = initialNumber;
    }

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function getNumber() public view returns (uint256) {
        return number;
    }
}
```

## Smart Contract Functions

| Function | Description |
|---|---|
| `constructor(uint256)` | Initializes the number during deployment. |
| `setNumber(uint256)` | Updates the stored number. |
| `getNumber()` | Returns the currently stored number. |

## How SimpleStorage Works

1. Deploy the contract with an initial value of `100`.
2. The constructor stores this value in the blockchain.
3. Call `getNumber()` to retrieve the stored value.
4. Call `setNumber(250)` to update the value.
5. Call `getNumber()` again to verify the updated value.

## Deployment and Execution

1. Open Remix IDE.
2. Create `SimpleStorage.sol`.
3. Write the smart contract.
4. Compile it using a compatible Solidity compiler.
5. First deploy using Remix VM to understand local contract execution.
6. Enter `100` as the constructor argument.
7. Deploy the contract.
8. Call `getNumber()` and verify the result.
9. Call `setNumber()` with the value `250`.
10. Confirm the transaction.
11. Call `getNumber()` again.

### Deployment on Hardhat Local

The same contract was also deployed on the Hardhat Local network using MetaMask.

Deployment details from one successful local run:

| Field | Value |
|---|---|
| Network | Hardhat Local |
| Initial Number | 100 |
| Contract Address | `0x8464135c8F25Da09e49BC8782676a84730C318bC` |
| Deployment Block | 1 |
| Deployment Gas | 142,329 |
| Updated Number | 250 |
| Update Transaction Gas | 26,596 |

**Note:** Local deployment addresses and transaction details can change when the Hardhat node is restarted or the contract is redeployed.

---

# 3. Understanding the Development Environment

## What is Remix IDE?

Remix is an online development environment used to write, compile, deploy, and interact with Solidity smart contracts.

## What is MetaMask?

MetaMask is a cryptocurrency wallet that connects Remix to a blockchain network and allows users to approve transactions.

## What is Hardhat?

Hardhat provides a local Ethereum development network where smart contracts can be deployed and tested without using real cryptocurrency.

## What is Solidity?

Solidity is a programming language used to write smart contracts for Ethereum-compatible blockchains.

---

# 4. Important Commands

Start the local Hardhat blockchain:

```bash
npx.cmd hardhat node
```

Local network configuration:

```text
Network: Hardhat Local
RPC URL: http://127.0.0.1:8545
Chain ID: 31337
Currency: ETH
```

Keep the Hardhat terminal open while interacting with the local blockchain.


# 6. Learning Outcomes

Through these projects, I learned:

- Basics of Solidity programming.
- How to create and deploy smart contracts.
- How constructors initialize contract data.
- How blockchain transactions work.
- How to use Remix IDE.
- How to connect MetaMask with a local blockchain.
- How to use Hardhat Local Network.
- How to use mappings, arrays, structs, and events.
- How to implement basic voting restrictions.
- How to read and modify blockchain-stored data.
- How to inspect transaction receipts, gas usage, and block numbers.

---

