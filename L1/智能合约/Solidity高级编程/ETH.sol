//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract ETH{
  address payable public immutable owner;
  event sendEvent(address indexed _to, uint _amount);

  constructor() {
    owner = payable(msg.sender);
  }

  receive() external payable {
    emit sendEvent(msg.sender, msg.value);
  }
  function send(address payable _to, uint _amount) public {
    require(msg.sender == owner, "Not owner");
    bool success = _to.send(_amount);
    require(success, "Send failed");
   
  }

  function call(address payable _to, uint _amount) public payable {
    require(msg.sender == owner, "Not owner");
    (bool success, ) = _to.call{value: _amount}("");
    require(success, "Call failed");
  
  }

  function transfer(address payable _to, uint _amount) public payable {
    require(msg.sender == owner, "Not owner");
    _to.transfer(_amount);

  }
}