// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract Counter {
    uint private count;

    constructor(uint _count) {
        count = _count;
    }
    function getCount() public view returns (uint) {
        return count;
    }
    function increment() public {
        count++;
    }
    function decrement() public {
        count--;
    }
}
