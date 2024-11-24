// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "forge-std/console.sol";
//install foundry with npm init -y && npm install @foundry-rs/forge --save-dev

contract Example{
    uint256 a=100;
    uint256 b=type(uint256).max;

    bool c= true;

    constructor(){
        uint256 x;
        assembly{
            x:=sload(0x00)
        }
        console.log(x);


    }


 }