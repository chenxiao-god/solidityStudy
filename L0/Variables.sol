// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Variables {
    // 全局变量，存储在 storage 中
    uint256 public num = 11;
    address public owner ;
    string public str = "45xs";

    function doSomething() public {
        //// 局部变量，存储在 memory 中
        uint256 num = 123;
        // 局部变量覆盖全局变量
        owner = msg.sender;
     
        uint256 time = block.timestamp;
        owner = msg.sender;

    }
}
