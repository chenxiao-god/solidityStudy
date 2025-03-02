// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SimpleBankV1 {
    mapping(address => uint256) public balances;

    // 存钱函数
    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    // 取钱函数
    function withdraw(uint256 amount) external {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    // 获取账户余额
    function getBalance() external view returns (uint256) {
        return balances[msg.sender];
    }
}