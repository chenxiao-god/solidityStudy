// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "./IVault.sol";
contract Bank is IVault{
    mapping(address => uint) public balances;
    function deposit() external payable override{
        balances[msg.sender] += msg.value;
    }
    function withdraw(uint _amount) external override{
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }
    function balance() external view override returns (uint){
        return balances[msg.sender];
    }

}