// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract Constants {
//constant 关键字用于声明常量变量。一旦变量被声明为 constant，就必须在声明时进行初始化，并且在整个合约的生命周期内其值不能被修改。编译器会在编译时将 constant 变量的值直接嵌入到代码中，因此不会为其分配存储（storage）空间，这有助于节省部署和运行合约的成本。
  address public  constant MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
  uint256 public constant MY_UINT = 123;
}