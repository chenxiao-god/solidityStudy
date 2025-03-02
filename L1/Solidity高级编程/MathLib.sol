//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
library MathLib{
    function add(uint a, uint b) external pure returns (uint){
        return a + b;
    }
    function sub(uint a, uint b) external pure returns (uint){
        return a - b;
    }
    function mul(uint a, uint b) external pure returns (uint){
        return a * b;
    }
    function div(uint a, uint b) external pure returns (uint){
        return a / b;
    }
    function mod(uint a, uint b) external pure returns (uint){
        return a % b;
    }
}