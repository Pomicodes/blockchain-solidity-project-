pragma solidity ^0.8.20;

contract Sidekick {
    function sendAlert(address hero) external {
        hero.call(abi.encodeWithSignature("alert()"));
    }
}