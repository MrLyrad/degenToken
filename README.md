# DegenToken Project

DegenToken (DGN) is a decentralized ERC20 token deployed on the Avalanche blockchain.

## Description

The DegenToken smart contract, written in Solidity, utilizes the OpenZeppelin library to ensure a secure and standardized ERC20 implementation. It is deployed on the Avalanche blockchain and includes the following features:

### Key Features

1. **Minting Tokens:**
   - The platform owner can mint new DegenTokens, allowing Degen Gaming to reward players based on in-game achievements and activities.
   - **Function:** `mint(address to, uint256 amount)`
   - **Access:** Only the contract owner can mint new tokens.

2. **Transferring Tokens:**
   - Players can transfer their DegenTokens to other players, fostering a dynamic in-game economy where tokens can be traded for goods, services, or other tokens.
   - **Function:** `transferTokens(address _receiver, uint256 _value)`
   - **Requirement:** The sender must have a sufficient balance of DegenTokens.

3. **Redeeming Tokens:**
   - Players can redeem DegenTokens for exclusive items in the in-game store. Each item has a specific token cost and can only be redeemed once.
   - **Function:** `redeemTokens(uint8 input)`
   - **Requirement:** The player must have enough tokens to cover the cost and the item must not have been previously redeemed.

4. **Checking Token Balance:**
   - Players can check their DegenToken balance at any time, ensuring transparency and informed decision-making about spending and saving.
   - **Function:** `getBalance()`
   - **Output:** Returns the player's token balance.

5. **Burning Tokens:**
   - Players can burn their DegenTokens if they no longer need them, reducing the total token supply and potentially increasing the value of remaining tokens.
   - **Function:** `burnTokens(uint256 _value)`
   - **Requirement:** The player must have enough tokens to cover the burn amount.

6. **Store Items:**
   - The smart contract includes a predefined list of store items that can be redeemed with tokens. Each item has a unique identifier, name, token cost, and redemption status.
   - **Function:** `showStoreItems()`
   - **Output:** Returns a list of available store items with details.

## Getting Started

### Prerequisite
0. You need a MetaMask wallet, account, and balance on the Avalanche Fuji Testnet.

### Downloading the Project
1. Clone or download the repository.
2. Open the terminal in the project's root directory.
3. Run `npm install`.
4. Wait for the dependencies to install.

### Connecting to Remix
5. Run `remixd`.
6. Open Remix and select the "File Explorer" tab.
7. Under "Workspaces," choose and select "connect to localhost."
8. Click "Connect."

### Compiling and Deploying
9. In the "Solidity compiler" tab, click the Compile button (this might be unnecessary if auto compile is enabled).
10. Switch to the "Deploy & run transactions" tab.
11. Under "Environment," select "Injected Provider - MetaMask."
12. Check if MetaMask is connected to the Avalanche Fuji Testnet.
13. To deploy, click the "Deploy" button.
14. To check the deployed contract, enter `0xc2f1d4e6d74f892D8b6a92c5425D58accaB30900` next to the "At Address" button and click it.

## Help

For any issues or questions, Please refer to the official ERC20 documentation and Remix IDE tutorials for additional guidance.

## Authors
John Armand V. Yabut
