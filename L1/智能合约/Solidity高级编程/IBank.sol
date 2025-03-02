//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "./IVault.sol";
contract IBank{
  IVault private vault;
  
  constructor(address _vault){
    vault = IVault(_vault);
  }
  function deposit() external payable{
    vault.deposit{value:msg.value}();
  }
  function withdraw(uint _amount) external{
    vault.withdraw(_amount);
  } 
  
}