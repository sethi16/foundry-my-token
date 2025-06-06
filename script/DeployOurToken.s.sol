//SPDX-LICENSE-IDENTIFIER: MIT
pragma solidity ^0.8.18;

// Update the import to match the actual contract name in MyLovelyToken.sol
import {OurLovelyToken} from "../src/MyLovelyToken.sol";
import {Script} from "forge-std/Script.sol";

contract DeployOurToken is Script {
    uint256 initialSupply = 100 ether;

    function run() external returns (OurLovelyToken) {
        vm.startBroadcast();
        OurLovelyToken token = new OurLovelyToken(initialSupply);
        vm.stopBroadcast();
        return token;
    }
    // Always remember, when we deploy our contract functions runs automatically by fundry
    // Only, when I deploy via forge not by some contract in that case need to call the function manually
}

