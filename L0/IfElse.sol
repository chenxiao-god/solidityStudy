// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract IfElse {
    function ifelse(uint256 _num) public pure returns(uint256) {
        if(_num == 1) {
            return 1;
        } else if(_num == 2) {
            return 2;
        } else {
            return 3;
        }
    }
  function ternary(uint256 _num) public pure returns(uint256) {
    return _num == 1 ? 1 : _num == 2 ? 2 : 3;
  }  
}