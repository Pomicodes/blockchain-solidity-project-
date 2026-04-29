pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }

    Proposal[] public proposals;

    mapping(address => bool) public members;

    mapping(uint => mapping(address => bool)) public hasVoted;
    mapping(uint => mapping(address => bool)) public voteChoice;

    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);

    constructor(address[] memory _members) {
        members[msg.sender] = true;

        for (uint i = 0; i < _members.length; i++) {
            members[_members[i]] = true;
        }
    }

    function newProposal(address _target, bytes calldata _data) external {
        require(members[msg.sender], "Not a member");

        proposals.push(Proposal({
            target: _target,
            data: _data,
            yesCount: 0,
            noCount: 0
        }));

        emit ProposalCreated(proposals.length - 1);
    }

    function castVote(uint proposalId, bool support) external {
        require(members[msg.sender], "Not a member");
        require(proposalId < proposals.length, "Invalid proposal");

        Proposal storage p = proposals[proposalId];

        if (hasVoted[proposalId][msg.sender]) {
            bool previous = voteChoice[proposalId][msg.sender];

            if (previous == support) return;

            if (previous) {
                p.yesCount--;
                p.noCount++;
            } else {
                p.noCount--;
                p.yesCount++;
            }

            voteChoice[proposalId][msg.sender] = support;
        } else {
            hasVoted[proposalId][msg.sender] = true;
            voteChoice[proposalId][msg.sender] = support;

            if (support) p.yesCount++;
            else p.noCount++;
        }

        emit VoteCast(proposalId, msg.sender);
    }
}