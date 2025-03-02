// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract TestFunc {
    bytes4 private storeSelecter;
   
    function test1(uint8 param) external pure returns (uint256) {
        return param * param;
    }

    function test2(uint8 param) external pure returns (uint8) {
        return param * 2;
    }

    // 函数签名
    function getTest1Selectr() external pure returns (bytes4) {
       // bytes4 selector = bytes4(keccak256("a(uint256)"));
        return this.test1.selector;
    }
   // 函数签名
    function getTest2Selectr() external pure returns (bytes4) {
        return this.test2.selector;
    }

    // 函数签名持久化
    function _storeSelecter(bytes4 select) external {
        storeSelecter = select;
    }
    // 函数签名调用
    function callFuc(bytes4 select, uint8 param) external returns (uint256) {
        (bool success, bytes memory data) = address(this).call(
            abi.encodeWithSelector(select, param)
        );
        require(success, "Function call failed");
        return abi.decode(data, (uint256));
    }
}