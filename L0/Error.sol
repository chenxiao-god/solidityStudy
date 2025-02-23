// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Error{
  // 异常的处理
  // 自定义异常
   error MyError(uint256 i);
  // 1. require
  // 当条件不满足时，抛出异常并终止执行
  function testRequire(uint _i) public pure {
    require(_i <= 10, "i must be less than or equal to 10");
  }
  // 2. assert
  // 当条件不满足时，抛出异常并终止执行
  function testAssert(uint _i) public pure {
    assert(_i <= 10);
  }
  // 3. revert
  // 当条件不满足时，抛出异常并终止执行
  function testRevert(uint _i) public pure {
    if(_i > 10) {
      revert MyError(_i);
    }
  }
 // 在 Solidity 中，require 通常是最便宜的异常判断方式，尤其是在进行用户输入验证和常见的条件检查时。它既能在条件不满足时合理返还 gas，又能以较低的开销完成检查操作。而 assert 主要用于内部不变量的检查，成本较高，应谨慎使用；revert 则更适合在需要复杂条件判断后直接触发回滚的场景中使用。
}