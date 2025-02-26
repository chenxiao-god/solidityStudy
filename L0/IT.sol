// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import"./InterfaceTest.sol";
contract IT  is  interfaceTest{
   function test() override external{
    require(msg.sender==owner,"Not Owner");
   }
   function val() view override external returns(uint256){
    return 10;
   }
}
