// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    // Allow contract to receive ether directly (for testSendEther)
    receive() external payable {
        // Ether received, automatically stored
    }
    
    // Send any received ether to the owner (for testTip)
    function tip() public payable {
        (bool success, ) = owner.call{ value: msg.value }("");
        require(success, "Transfer failed");
    }
}