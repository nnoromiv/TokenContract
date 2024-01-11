// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./YourToken.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Faucet is Ownable {
    YourToken public existingTokenContract;
    uint256 public requestCoolDown = 15 minutes;
    uint256 public faucetBalance;

    mapping(address => uint256) public lastRequestTimestamp;
    mapping(address => uint256) private _balances;

    constructor(address _existingTokenAddress){
        existingTokenContract = YourToken(_existingTokenAddress);
        faucetBalance = existingTokenContract.balanceOf(msg.sender);
    }

    function requestTokens() external {
        require(block.timestamp - lastRequestTimestamp[msg.sender] >= requestCooldown, "Cooldown period not elapsed");

        lastRequestTimestamp[msg.sender] = block.timestamp;
        uint256 amount = 5 * 10**18;

        require(faucetBalance >= amount, "Faucet balance too low");

        faucetBalance -= amount;
        existingTokenContract.transfer(msg.sender, amount);
    }

    function setCoolDownForAddress(address user, uint256 cooldown) external onlyOwner {
        lastRequestTimestamp[user] = block.timestamp - cooldown;
    }

    function getCoolDownForAddress(address user) public view returns (uint256) {
        return lastRequestTimestamp[user] + requestCooldown - block.timestamp;
    }
}