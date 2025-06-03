//SPDX-LICENSE-IDENTIFIER: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";
import {OurLovelyToken} from "../src/MyLovelyToken.sol";
import {console} from "forge-std/console.sol";

contract OurTokenTest is Test{
    DeployOurToken deployer;
    OurLovelyToken token;
    uint256 AccountBalance = 100 ether; // 3 * 10^18
    uint256 transferAmount = 20 ether; // 10 * 10^18
    uint256 balance = 2 ether;

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");
// Always remember, incase of deploying a script contract,
// which gives value to the src file constructor, no need to give values in testing contract
    function setUp() public {
        deployer = new DeployOurToken();
        token = deployer.run();
        // token is equal to this function because the run function deploy the token contract
        // So, here i indirectly deploy the contract 
        vm.prank(msg.sender);
        token.transfer(bob, AccountBalance);
    }
    function testBobBalance() public {
        assertEq(AccountBalance,token.balanceOf(bob));
    }
    function testAllowanceWork() public{
        vm.prank(bob);
        token.approve(alice,transferAmount);  
        assertEq(token.allowance(bob,alice),transferAmount);  
        
        vm.prank(alice);
        token.transferFrom(bob , alice , transferAmount);

        vm.prank(alice);
        token.transfer(bob, balance);
        assertEq(token.balanceOf(bob) + token.balanceOf(alice), AccountBalance);
        }
}