//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "./MathLib.sol";
import "./Arrays.sol";
contract Calc {
    using MathLib for uint;
    using Arrays for uint[];

    function add(uint _a, uint _b) public pure returns (uint) {
        return _a.add(_b);
    }
    function sub(uint _a, uint _b) public pure returns (uint) {
        return _a.sub(_b);
    }

    function find(
        uint[] memory _arr,
        uint _target
    ) public pure returns (uint) {
        return _arr.find(_target);
    }
}
