// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleBankV2 {
    mapping(address => uint256) public balances;
    mapping(address => uint256[]) public transactionTimestamps;

    // 存钱函数
    function deposit() external payable {
        balances[msg.sender] += msg.value;
        transactionTimestamps[msg.sender].push(block.timestamp);
    }

    // 取钱函数
    function withdraw(uint256 amount) external {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        transactionTimestamps[msg.sender].push(block.timestamp);
        payable(msg.sender).transfer(amount);
    }

    // 获取账户余额
    function getBalance() external view returns (uint256) {
        return balances[msg.sender];
    }

    // 获取交易时间戳
    function getTransactionTimestamps() external view returns (uint256[] memory) {
        return transactionTimestamps[msg.sender];
    }
}