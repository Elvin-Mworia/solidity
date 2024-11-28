// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Escrow {
	address public arbiter;
	address public beneficiary;
	address public depositor;
    event Approved (uint);

	constructor(address _arbiter, address _beneficiary) payable {
		arbiter = _arbiter;
		beneficiary = _beneficiary;
		depositor = msg.sender;
	}
//function to send all the funds to the beneficiary address
	function approve() external {
        if(msg.sender!=arbiter){
			revert("only the arbiter should call the approve function");
		}
//emit the approved event which takes in the contract's balance
        emit Approved(address(this).balance);
		(bool success, ) = beneficiary.call{ value: address(this).balance }("");
		require(success);
	}
}
