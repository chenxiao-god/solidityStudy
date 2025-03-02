//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract SimpleWallet{
mapping(address => uint) public balances;
event deposit(address indexed _from, uint256 _n);
event withdraw(address indexed _from, uint256 _n);
// 存款
 function deposit() public payable{
     balances[msg.sender] += msg.value;
     emit deposit(msg.sender, msg.value);
 }
 // 取款
 function withdraw(uint _amount) public{
     require(balances[msg.sender] >= _amount,"not enough balance");
     balances[msg.sender] -= _amount;
     payable(msg.sender).transfer(_amount);
     emit withdraw(msg.sender, _amount);
 }
 // 获取余额
 function getBalance() public view returns(uint){
     return address(this).balance;
 }
}