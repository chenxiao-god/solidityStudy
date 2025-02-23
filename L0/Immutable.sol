// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Immutable {
    // immutable 关键字用于声明不可变变量。与 constant 不同，immutable 变量可以在声明时不进行初始化，但必须在合约的构造函数中完成初始化。一旦初始化完成，其值在合约的生命周期内也不能被修改。immutable 变量会占用存储（storage）空间，但只在部署合约时写入一次值，后续不能再修改。
    uint256 public immutable num = 11;
    address public immutable owner;
}