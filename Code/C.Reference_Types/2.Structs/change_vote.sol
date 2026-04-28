pragma solidity ^0.8.20;

contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;

    function hasVoted(address user) public view returns (bool) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == user) {
                return true;
            }
        }
        return false;
    }

    function createVote(Choices choice) external {
        require(!hasVoted(msg.sender), "Already voted");
        votes.push(Vote(choice, msg.sender));
    }

    function changeVote(Choices newChoice) external {
        bool found = false;

        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == msg.sender) {
                votes[i].choice = newChoice;
                found = true;
                break;
            }
        }

        require(found, "No existing vote");
    }

    function findChoice(address user) external view returns (Choices) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == user) {
                return votes[i].choice;
            }
        }
        return votes[0].choice;
    }
}