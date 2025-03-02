// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
abstract contract Shape {
    function area(uint _length, uint _width) public pure virtual returns (uint ) ;
}