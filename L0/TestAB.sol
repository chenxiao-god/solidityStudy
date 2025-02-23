// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "./TestA.sol";
import "./TestB.sol";
contract TestAB is TestA, TestB{
  string public sex;
 constructor(string memory _sex) TestA(uint8 _age)TestB(string memory _name){
  sex = _sex;
 }
}