// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract Gas {
    uint256 public num = 11;
    // 循环 Gas会被消耗完后  交易失败 
    function forLoop() public {
        while (true) {
            num++;
        }
    }
}
