# ResearchVoting

A decentralized platform for selecting academic research proposals using blockchain technology.

## Overview

ResearchVoting enables academic institutions to submit research proposals and gather peer votes in a transparent, immutable way. The system ensures that each researcher can only vote for one proposal at a time, maintaining selection integrity while providing clear metrics on proposal popularity for funding decisions.

## Features

- **Proposal Submission**: Any researcher can submit a new research proposal
- **Transparent Voting**: All votes for proposals are recorded on the blockchain
- **One Vote Per Researcher**: Each researcher can only vote for one proposal at a time
- **Vote Tracking**: Real-time tracking of vote counts for each proposal
- **Selection Metrics**: Easy access to proposal counts and voting statistics

## Functions

### Public Functions

- `submit-proposal`: Submit a new research proposal for consideration
- `vote-proposal`: Cast your vote for an existing proposal

### Read-Only Functions

- `get-vote-count`: View the total votes for a specific proposal
- `has-voted`: Check if a researcher has already voted for a proposal
- `get-proposal-count`: Get the total number of proposals submitted
- `compare-highest`: Utility function to compare two values

## Getting Started

1. Deploy the contract to your blockchain
2. Researchers can begin submitting research proposals
3. Peers can vote for proposals they believe deserve funding
4. Track proposal votes to determine funding priorities

## Use Cases

- Academic research funding allocation
- Grant distribution for scientific projects
- Peer review and selection processes
- Decentralized research prioritization

## Security

The system ensures selection integrity by limiting each researcher to voting for only one proposal at a time, preventing manipulation of funding decisions.