// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "./MyStruct.sol";
contract DataLocations {
  uint256[] private arr;
  mapping(uint256 => address) private map;
  mapping(uint256 => MyStruct) private myStructMap;


    function f() public {
          //
        _f(arr, map, myStructs[1]);

        // get a struct from a mapping
        MyStruct storage myStruct = myStructs[1];
        // create a struct in memory
        MyStruct memory myMemStruct = MyStruct(0);
    }
    function _f(
        uint256[] storage _arr,
        mapping(uint256 => address) storage _map,
        MyStruct storage _myStruct
    ) internal {
 
    }
    function g(uint256[] memory _arr) public returns (uint256[] memory) {
        return _arr;
    }

    function h(uint256[] calldata _arr) external {

      
    }
}