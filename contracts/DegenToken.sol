// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "hardhat/console.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {

    struct Product {
        uint costInTokens;
        string name;
        bool redeemed;
    }

    Product[] private products;

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        products.push(Product(10, "Roblox - Basta NFT", false));
        products.push(Product(11, "PS5 NFT", false));
        products.push(Product(12, "Twice Merch", false));
        products.push(Product(13, "Sword NFT", false));
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount); 
    }

    function decimals() override public pure returns (uint8) {
        return 0;
    }

    function getBalance() external view returns (uint256) {
        return this.balanceOf(msg.sender);
    }

    function transferTokens(address receiver, uint256 value) external {
        require(balanceOf(msg.sender) >= value, "Insufficient DGN tokens for transfer!");
        approve(msg.sender, value);
        transferFrom(msg.sender, receiver, value);
    }

    function burnTokens(uint256 value) external {
        require(balanceOf(msg.sender) >= value, "Insufficient DGN tokens to burn!");
        burn(value);
    }

    function redeemTokens(uint8 index) external payable returns (string memory) {
        require(index >= 0 && index < 4, "Invalid selection");
        require(!products[index].redeemed, "This product has already been redeemed!");
        require(balanceOf(msg.sender) >= products[index].costInTokens, "Insufficient DGN tokens to redeem this product!");

        approve(msg.sender, products[index].costInTokens);
        transferFrom(msg.sender, owner(), products[index].costInTokens);
        products[index].redeemed = true;

        return string.concat(products[index].name, " has been redeemed!");
    }

    function displayProducts() public view returns (string memory) {
        string memory productList = "";

        for (uint i = 0; i < 4; i++) {
            productList = string.concat(productList, "   ", Strings.toString(i), ". ", products[i].name);
        }

        return productList;
    }
}
