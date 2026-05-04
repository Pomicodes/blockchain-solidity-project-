pragma solidity ^0.8.20;

contract Sidekick {
    function relay(address hero, bytes calldata data) external {
        hero.call(data);
    }
}