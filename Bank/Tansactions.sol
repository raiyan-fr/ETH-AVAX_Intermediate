//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// A smart contract which is able to do proper Transactions
//deploy.js
contract Bank {

    mapping(address => uint) private balances;

    event deposit(address indexed owner,uint value);
    event withdraw(address indexed owner, uint value);
    event transaction(address indexed sender,address indexed reciever,uint value);

    function Deposit(address _acc,uint _val) public payable {
        balances[_acc] += _val;
        emit deposit(_acc,_val);
    }
    function Withdraw(address _acc,uint _val) public payable {
        require(balances[_acc] > 0,"Poor peoples hahaha");
        balances[_acc] += _val;
        emit withdraw(_acc,_val);
    }
    function Transaction(address _sender,address _reciever,uint _val) public payable {
        require(balances[_sender] > 0,"You don't have enough money,You broke");
        balances[_sender] -= _val;
        balances[_reciever] += _val;
        emit transaction(_sender, _reciever, _val);
    }
    function getbalances(address _address) public view returns(uint){
        return balances[_address];
    }
}
    
