Voting Contract
In this tutorial we're going to build a voting contract! We'll use the lessons learned here to understand how the Governor standard emerged

Proposals
We're going to focus on creating a voting contract that will allow members to create new proposals. This contract can contain many proposals which will be voted on by a group of members. Each proposal will keep track of its votes to decide when its time to execute.

At execution time, these proposals will send calldata to a smart contract. The calldata could be anything! We could have a Voting system that allows 100 members to decide when to upgrade a protocol. The calldata might target a function with the signature upgrade(address) and send over the new protocol implementation. That would be a very cool use of your Voting contract!
