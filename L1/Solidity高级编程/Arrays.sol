//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
library Arrays {
    function find(uint[] memory _array, uint _target) public pure returns (uint) {
        for (uint i = 0; i < _array.length; i++) {
            if (_array[i] == _target) {
                return i;
            }
        }
        revert("not found");
    }
    function contains(uint[] memory _array, uint _target) public pure returns (bool) {
        for (uint i = 0; i < _array.length; i++) {
            if (_array[i] == _target) {
                return true;
            }
        }
        return false;
    }
}