pragma solidity ^0.8.20;

contract Contract {
    address public owner;

    constructor() payable {
        owner = msg.sender;
        require(msg.value >= 1 ether);
    }

    function withdraw() public {
        require(msg.sender == owner);
        (bool success, ) = owner.call{value: address(this).balance}("");
        require(success);
    }
}