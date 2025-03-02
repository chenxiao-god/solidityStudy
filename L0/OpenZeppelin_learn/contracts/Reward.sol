//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "./ERC20MinerReward.sol";
contract Reward {
    ERC20MinerReward public erc20;
    address public owner;

    constructor(address _erc20) {
        erc20 = ERC20MinerReward(_erc20);
        owner = msg.sender;
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "only owner can call this function");
        _;
    }
    function reward(address _to, uint256 _amount) public  onlyOwner(){
      require(erc20.balanceOf(address(this))>_amount, "toknen is not enough");
        erc20.transfer(_to, _amount);
    }

}