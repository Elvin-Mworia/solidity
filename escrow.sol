// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Escrow {
	address public arbiter;
	address public beneficiary;
	address public depositor;

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
		(bool success, ) = beneficiary.call{ value: address(this).balance }("");
		require(success);
	}
}
