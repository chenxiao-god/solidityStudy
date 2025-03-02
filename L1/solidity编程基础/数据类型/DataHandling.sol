// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract DataHandling {
    uint256[] private data;

    function updateData(uint256[] memory _data) public {
        data = _data;
    }

    function getDtata() public view returns (uint256[] memory) {
        return data;
    }

    function modifyStorgeData(uint index,uint value) public  {
        require(index< data.length,"index Out of bounds");
          data[index]=value;
    }
    function modiferMemoryData(uint[] memory _data)public pure  returns (uint[] memory ) {
        if(_data.length>0 ){
        _data[0]=999;
        }
        return  _data;
    }
}