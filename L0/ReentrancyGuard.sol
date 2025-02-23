// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract ReentrancyGuard {
  // 利用合约变量 实现防重入
  bool private locked;
    modifier lock() {
        require(!locked);
        locked = true;
        _;
        locked = false;
    }

   // 测试函数
    function test() public lock {
        // 调用合约
        bytes memory b = "";
        msg.sender.call(b);
    }
}