//SPDX-LICENSE-IDENTIFIER: MIT

pragma solidity ^0.8.18;

contract MyToken {
    // State Variable
    string public Token ;

    // mapping
    mapping(address => uint256) public balances;

    constructor() {
        Token = "MyToken";
        balances[msg.sender] = 3 ether; // 3 * 10^18
    }
    

    function name() public view returns (string memory){
        return Token;
    }
    function decimals() public pure returns (uint8){
        return 18;
    }
    function totalSupply() public pure returns (uint256){
        return 3 ether; // 3 * 10^18
    }
    function balanceOf(address _owner) public view returns (uint256 balance) {
        // Dummy implementation, always returns 0
        return balances[_owner];
    }
    function transfer(address to, uint256 value) public {
          require(balances[msg.sender] >= value, "Not enough balance");
        uint256 previousBalance = balanceOf(msg.sender) + balanceOf(to);
        balances[msg.sender] -= value;
        balances[to] += value;
        require(balances[msg.sender] + balances[to] == previousBalance, "Value checked");
    }
}
