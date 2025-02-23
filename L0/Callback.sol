// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "./InterfaceTest.sol";
contract Callback {
    uint256 private val;

    fallback() external payable {
        val = InterfaceTest(msg.sender).val();
    }
    function test(address _addr) external payable {
        InterfaceTest(_addr).test();
    }
}
