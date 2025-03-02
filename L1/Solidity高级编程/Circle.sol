//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "./Shape.sol";
contract Circle is Shape {
    function area(uint _length, uint _width) public pure override returns (uint ) {
        return _length * _width;
    }
}