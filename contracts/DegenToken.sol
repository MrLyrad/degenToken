// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// Importing open zeppelin libraries to utilize ERC20 functionalities
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "hardhat/console.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {
    mapping(uint => bool) private itemsRedeemed;

    constructor()
    ERC20("Degen", "DGN")
    Ownable(msg.sender)
    {}

    // Using the mint function from the ERC20
    function mint(address to, uint256 _amt) public onlyOwner {
        _mint(to, _amt); 
    }

    function getBalance() external view returns (uint256) {
        return this.balanceOf(msg.sender);
    }

    function redeemTokens(uint8 input) external payable returns (string memory) {
        // Error handling to check if the input is within range 0-3
        require(input < 4, "Ensure that input is only from 0-3!");
        // Error handling to check if the item is already in the inventory
        require(itemsRedeemed[input] == false, "The item was already redeemed!");

        string memory item;
        uint tokenCost;

        // Checking the user input using if conditionals
        if (input == 0) {
            item = "T-Shirt NFT";
            tokenCost = 5;
        }
        if (input == 1) {
            item = "Cellphone NFT";
            tokenCost = 10;
        }
        if (input == 2) {
            item = "Car NFT";
            tokenCost = 15;
        }
        if (input == 3) {
            item = "House NFT";
            tokenCost = 20;
        }

        require(balanceOf(msg.sender) >= tokenCost, "Not enough DGN tokens!");

        approve(msg.sender, tokenCost);
        transferFrom(msg.sender, owner(), tokenCost);

        // Update the item redeemed by the user
        itemsRedeemed[input] = true;

        return string.concat(item, " was successfully redeemed!");
    }

    function showItems() public pure returns (string memory) {
        return "0 - T-Shirt NFT,    1 - Cellphone NFT,    2 - Car NFT,    3 - House NFT";
    }

    // Using the transfer function from the ERC20
    function transferTokens(address _receiver, uint256 _amt) external {
        // Error handling using require
        require(balanceOf(msg.sender) >= _amt, "Not enough DGN tokens!");
        approve(msg.sender, _amt);
        transferFrom(msg.sender, _receiver, _amt);
    }

    // Using the burn function from the ERC20
    function burnTokens(uint256 _amt) external {
        // Error handling using require
        require(balanceOf(msg.sender) >= _amt, "Not enough DGN tokens!");
        burn(_amt);
    }
}
