// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./IERC20.sol"; 

contract TokenAirdrop {
    address public owner;
    IERC20 public token;
    uint256 public airdropQuantity;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    constructor(address _tokenAddress) {
        owner = msg.sender;
        token = IERC20(_tokenAddress);
        airdropQuantity = 1; // Default airdrop quantity, can be modified later
    }

    function setAirdropQuantity(uint256 _quantity) external onlyOwner {
        airdropQuantity = _quantity;
    }

    function executeAirdrop(address[] calldata _recipients) external onlyOwner {
        // Airdrop tokens to multiple recipients
        for (uint256 i = 0; i < _recipients.length; i++) {
            require(token.transfer(_recipients[i], airdropQuantity), "Token transfer failed");
        }
    }

    function modifyAirdropQuantity(uint256 _newQuantity) external onlyOwner {
        airdropQuantity = _newQuantity;
    }
}
