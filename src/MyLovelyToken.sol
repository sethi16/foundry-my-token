// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OurLovelyToken is ERC20 {

     constructor(uint256 initialSupply) ERC20("OurLoveyToken", "OLT") {
        // Called the ERC20 constructor with the token name and symbol
        // Mint the initial supply to the deployer
        _mint(msg.sender, initialSupply); // msg.sender is the address of the contract deployer
        // _mint 
    }
}
