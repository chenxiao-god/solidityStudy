// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract Payable{
mapping(address => bool) whitelist;
function addWhitelist(address _address) public{
    whitelist[_address] = true;
}
function removeWhitelist(address _address) public{
    whitelist[_address] = false;
}
function checkWhitelist(address _address) public view returns(bool){
    return whitelist[_address];
}
function pay(address _address) public payable{
    require(checkWhitelist(_address),"not in whitelist");
    payable(_address).transfer(msg.value);
}
}