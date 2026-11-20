
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Voting {

    // Candidate structure
    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }

    // Array to store candidates
    Candidate[] public candidates;

    // Mapping to track voters
    mapping(address => bool) public voted;

    // Event generated after successful voting
    event VoteCast(
        address indexed voter,
        uint256 indexed candidateId,
        string candidateName
    );

    // Constructor
    constructor() {

        candidates.push(
            Candidate(1, "Candidate A", 0)
        );

        candidates.push(
            Candidate(2, "Candidate B", 0)
        );

        candidates.push(
            Candidate(3, "Candidate C", 0)
        );
    }

    // Get total number of candidates
    function getCandidateCount()
        public
        view
        returns (uint256)
    {
        return candidates.length;
    }

    // Get particular candidate details
    function getCandidate(uint256 candidateId)
        public
        view
        returns (
            uint256 id,
            string memory name,
            uint256 voteCount
        )
    {
        require(
            candidateId > 0 &&
            candidateId <= candidates.length,
            "Invalid candidate ID"
        );

        Candidate memory c =
            candidates[candidateId - 1];

        return (c.id, c.name, c.voteCount);
    }

    // Get all candidates
    function getCandidates()
        public
        view
        returns (Candidate[] memory)
    {
        return candidates;
    }

    // Check whether an address has voted
    function hasVoted(address voter)
        public
        view
        returns (bool)
    {
        return voted[voter];
    }

    // Cast a vote
    function vote(uint256 candidateId) public {

        require(
            !voted[msg.sender],
            "You have already voted"
        );

        require(
            candidateId > 0 &&
            candidateId <= candidates.length,
            "Invalid candidate ID"
        );

        // Mark voter as voted
        voted[msg.sender] = true;

        // Increase candidate vote count
        candidates[candidateId - 1].voteCount++;

        // Emit voting event
        emit VoteCast(
            msg.sender,
            candidateId,
            candidates[candidateId - 1].name
        );
    }
}
