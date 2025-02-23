// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract SimpleStorage {
    uint256 private num; 
    function setNum(uint256 _num) public {
        num = _num;
    }
    function getNum() public view returns(uint256) {
        return num;
    }
}