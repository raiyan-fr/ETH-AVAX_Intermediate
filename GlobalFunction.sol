// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalFunctionsAndVariables {
    uint public balance; // Public variable to store the contract's balance

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function transferEther(address payable _to, uint _amount) public {
        require(_to != address(0), "Invalid recipient address");
        require(_amount <= address(this).balance, "Insufficient balance");
        
        _to.transfer(_amount);
    }
    // as both transfer() and send() functions are same
    function sendEther(address payable _to, uint _amount) public {
        require(_to != address(0), "Invalid recipient address");
        require(_amount <= address(this).balance, "Insufficient balance");
        
        (bool success, ) = _to.call{value: _amount}("XD");
        require(success, "Transfer failed");
    }

    function getCoinbase() public view returns (address) {
        return block.coinbase;
    }

    function getTimestamp() public view returns (uint) {
        return block.timestamp;
    }

    function getGasLimit() public view returns (uint) {
        return block.gaslimit;
    }

    function getBlockNumber() public view returns (uint) {
        return block.number;
    }

    function getOrigin() public view returns (address) {
        return tx.origin;
    }

    function getGasPrice() public view returns (uint) {
        return tx.gasprice;
    }

    function getSender() public view returns (address) {
        return msg.sender;
    }

    function getValue() public payable returns (uint) {
        return msg.value;
    }

    function getGasLeft() public view returns (uint) {
        return gasleft();
    }
}

