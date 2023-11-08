// different function view types

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract  ViewPureAndPayable{
    uint a= 69;
    function View(uint _a) external view returns(uint){
        return(_a + a);
    }

    function Pure() external pure returns(string memory) {
        return("Hello World");
    }

    address Owner;
    address payable public owner;

    constructor(){
        owner= payable(msg.sender);
    }
    modifier OnlyOwner {
        require (Owner == msg.sender,"only owner can access this smart contract");
        _;
    }

    function deposit() external payable {}

    function GetBallance() external view returns(uint){
        return address(this).balance;
    }
}

