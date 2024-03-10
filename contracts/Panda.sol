// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";


contract Panda is ERC20, Ownable, ReentrancyGuard {
    bool public airdropEnabled = false;

    constructor(address initialOwner, uint256 initialSupply) ERC20("Panda", "PND") Ownable(initialOwner) {
        _mint(msg.sender, initialSupply * 1**uint256(decimals()));
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function approve(address spender, uint256 amount) public override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), allowance(sender, _msgSender()) - amount);
        return true;
    }

    function toggleAirdrop() public onlyOwner {
        airdropEnabled = !airdropEnabled;
    }

    function airdropTokens(address[] memory recipients, uint256 amount) public onlyOwner nonReentrant {
        require(airdropEnabled, "Panda: Airdrop is currently disabled.");
        require(recipients.length > 0, "Panda: No recipients provided.");
        require(amount > 0, "Panda: Amount must be greater than 0.");

        uint256 totalAirdropAmount = recipients.length * amount;
        require(balanceOf(msg.sender) >= totalAirdropAmount, "Panda: Insufficient balance for airdrop.");

        for (uint256 i = 0; i < recipients.length; i++) {
            _transfer(msg.sender, recipients[i], amount);
        }
    }

}