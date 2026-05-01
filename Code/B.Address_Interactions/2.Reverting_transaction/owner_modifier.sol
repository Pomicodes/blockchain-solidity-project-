// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // These need to be first to occupy slots 0, 1, 2
    uint public a;
    uint public b;
    uint public c;
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
    
    function setA(uint _a) public onlyOwner {
        a = _a;
    }
    
    function setB(uint _b) public onlyOwner {
        b = _b;
    }
    
    function setC(uint _c) public onlyOwner {
        c = _c;
    }
    
    receive() external payable { }
}