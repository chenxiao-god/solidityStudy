// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
interface IVault {
    function deposit() external payable;
    function withdraw(uint _amount) external;
    function balance() external view returns (uint);
}