// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract BytesArray{
    bytes[] private bytesData;
    string[] private stringData;

    function getByte() public view returns (bytes[] memory){
        return bytesData;
    }
    
    function getString() public view returns(string[] memory) {
        return stringData;
    }

    function setByteArray(uint256 index, bytes memory _byteData) public{
        require(index <bytesData.length,"index is out of bounds");
        bytesData[index] = _byteData;
    }
    
    function setStringArrayByIndex(uint256 index, string memory _string) public {
        require(index<stringData.length , "Index is Out of bounds");
        
        stringData[index] = _string;
    }

    function removeByteByIndex(uint256 index) public{
        require(index <bytesData.length,"index out of bounds");
        delete bytesData[index];
    }
    
    function removeStringByIndex(uint256 index) public{
        require(index<stringData.length, "index is out of bounds");
         delete stringData[index];
    }



}