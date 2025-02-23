// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract TestTransientStorage {

bytes32 constant SLOT=0;
// 存储
function set(uint256 _num) public {
  // 将值存储到插槽中
    assembly{
        tstore(SLOT,_num)
    }
    bytes memory b='';
    msg.sender.call(b);

}