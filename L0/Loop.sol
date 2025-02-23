// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17; 
contract Loop {
    // 循环
    function forLoop() public pure returns(uint256) {
        uint256 sum = 0;
        for(uint256 i = 0; i < 10; i++) {
            sum += i;
        }
        return sum;
    }
    // 循环
    function whileLoop() public pure returns(uint256) {
        uint256 sum = 0;
        uint256 i = 0;
        while(i < 10) {
            sum += i;
            i++;
        }
        return sum;
    }
}