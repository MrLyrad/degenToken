# DegenToken Project

For this project, we are tasked to deploy DegenToken (DGN), a decentralized ERC20 token.

## Description

Here, a smart contract named `DegenToken.sol` smart contract uses the `OpenZeppelin` library to ensure a secure and standardized ERC20 token implementation. The contract is deployed on the Avalanche blockchain which can be monitored using `SnowTrace`.

### Key Features

1. **Minting Tokens:**
   - The platform owner can mint new tokens
   - **Function:** `mint(address to, uint256 amount)`
   - **Access:** Only the contract owner can mint new tokens.

2. **Transferring Tokens:**
   - Users can transfer tokens to other addresses,
   - **Function:** `transferTokens(address _receiver, uint256 _value)`
   - **Requirement:** The sender must have a sufficient balance of DegenTokens.

3. **Redeeming Tokens:**
   - Users can redeem various items using their tokens.
   - **Function:** `redeemTokens(uint8 input)`
   - **Requirement:** The user must have enough tokens for the item.

4. **Checking Token Balance:**
   - Users can check their balance.
   - **Function:** `getBalance()`
   - **Output:** Returns the user's token balance.

5. **Burning Tokens:**
   - Users can burn tokens.
   - **Function:** `burnTokens(uint256 _value)`
   - **Requirement:** The user must have enough tokens to cover the burn amount.

6. **Store Items:**
   - The smart contract includes a predefined list of store items that can be redeemed with tokens. Each item has a unique identifier, name, token cost, and redemption status.
   - **Function:** `showStoreItems()`
   - **Output:** Returns a list of available store items with details.

## Getting Started

### NOTE
**Ensure that the address of your MetaMask account is the same as the one you will be writing on various text fields requiring your wallet address.**

### Downloading the Project
1. Clone or download the repository.
2. Open the terminal in the project's root directory.
3. Run `npm install`.
4. Wait for the dependencies to install.

### Connecting to Remix
5. Run `remixd` locally.
6. Open Remix and select the `File Explorer` tab.
7. Under `Workspaces`, choose and select `connect to localhost` and click `Connect`.


### Running the Contract in Remix IDE.

* Open [Remix IDE](https://remix.ethereum.org/).
* In the "Solidity compiler" tab, click the Compile button (this might be unnecessary if auto compile is enabled).
* Switch to the "Deploy & run transactions" tab.
* Under the `Environment` drop-down menu, select `Injected Provider - MetaMask` and connect your respective MetaMask account.
* Verify whether your `MetaMask` account connected to the Avalanche Fuji Testnet in [SnowTrace](snowtrace.io).
* To check the deployed contract, enter your MetaMask next to the `At Address` button and then click it to deploy the contract to the chain.


## Authors

Daryl Juacalla
[@MrLyrad](https://github.com/MrLyrad)


## License

This project is licensed under the MIT License.

