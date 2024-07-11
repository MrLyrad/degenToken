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

    constructor() ERC20("Degen", "DGN") Ownable() {
        products.push(Product(5, "T-Shirt NFT", false));
        products.push(Product(10, "Cellphone NFT", false));
        products.push(Product(15, "Car NFT", false));
        products.push(Product(20, "House NFT", false));
    }

    // utilizing ERC20 built-in function to mint tokens
    function mint(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount); 
    }

    function decimals() override public pure returns (uint8) {
        return 0;
    }

    function getBalance() external view returns (uint256) {
        return this.balanceOf(msg.sender);
    }

    // utilizing ERC20 built-in function to transfer tokens
    function transferTokens(address _receiver, uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "Insufficient DGN tokens for transfer!");
        approve(msg.sender, _value);
        transferFrom(msg.sender, _receiver, _value);
    }

    // utilizing ERC20 built-in function to burn tokens
    function burnTokens(uint256 value) external {
        require(balanceOf(msg.sender) >= value, "Insufficient DGN tokens to burn!");
        burn(value);
    }

    function redeemTokens(uint8 index) external payable returns (string memory) {
        require(index >= 0 && index < 4, "Invalid selection, must be from 0-3 only!");
        require(!products[index].redeemed, "Product is already redeemed!");
        require(balanceOf(msg.sender) >= products[index].costInTokens, "Insufficient tokens to redeem the item!");

        approve(msg.sender, products[index].costInTokens);
        transferFrom(msg.sender, owner(), products[index].costInTokens);
        products[index].redeemed = true;

        // display the name of the redeemed product
        return string.concat(products[index].name, " has successfully been redeemed!");
    }

    function displayProducts() public view returns (string memory) {
        string memory productList = "";

        for (uint i = 0; i < 4; i++) {
            productList = string.concat(productList, "   ", Strings.toString(i), ". ", products[i].name);
        }

        return productList;
    }
}
