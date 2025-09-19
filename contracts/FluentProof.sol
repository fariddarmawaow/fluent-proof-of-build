// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FluentProof {
    address public owner;
    string public projectName;
    mapping(address => bool) public verifiedBuilders;

    event BuilderVerified(address indexed builder);

    constructor(string memory _projectName) {
        owner = msg.sender;
        projectName = _projectName;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not contract owner");
        _;
    }

    function verifyBuilder(address _builder) public onlyOwner {
        verifiedBuilders[_builder] = true;
        emit BuilderVerified(_builder);
    }

    function isVerified(address _builder) public view returns (bool) {
        return verifiedBuilders[_builder];
    }
}
