// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Event {
    // 事件: 用于记录合约执行过程中的重要信息  可以被监听和处理
    // 事件的声明: event 事件名(参数类型 参数名);
    event Log(string message, uint val);
    // 事件的触发: emit 事件名(参数值);
    function test() public {
        emit Log("Hello World", 123);
    }


}