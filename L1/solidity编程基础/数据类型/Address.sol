// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Address {
    address[] private adrArray;

    function update(address[] memory _adrArray) public {
        adrArray = _adrArray;
    }

    function getAddress() public view returns (address[] memory) {
        return adrArray;
    }

    function setAddressArrayByIndex(uint256 index, address value) public {
        require(index < adrArray.length, "index Out of bounds");
        adrArray[index] = value;
    }
    function getAddressByIndex(uint index) public view returns (address) {
         require(index<adrArray.length,"index Out of bounds");
         return adrArray[index];

    }
    function removeAddressByIndex(uint index) public {
           require(index< adrArray.length,"index Out of bounds");
           delete adrArray[index];

    }
    function arraySum(uint256[] memory _param) public pure returns (uint256) {
        uint256 sum;
        for (uint256 i = 0; i < _param.length; i++) {
            sum += _param[i];
        }
        return sum;
    }
}
