//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "./Person.sol";
import "./Employee.sol";
contract Manager is Person, Employee{
    function test(uint _age) public pure override(Person, Employee) returns (uint age) {
        return _age;
}
}