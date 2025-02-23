// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Mapping {
    // 映射
    mapping(uint256 => uint256) private myMapping;
    

    function set(uint256 _key, uint256 _value) public {
        myMapping[_key] = _value;
    }
    function get(uint256 _key) public view returns(uint256) {
        return myMapping[_key];
    }
    function remove(uint256 _key) public {
        delete myMapping[_key];
    }
}

contract NestedMapping {
    // 嵌套映射
    mapping(uint256 => mapping(uint256 => uint256)) private nestedMapping;\
    function set(uint256 _key1, uint256 _key2, uint256 _value) public {
        nestedMapping[_key1][_key2] = _value;
    }
    function get(uint256 _key1, uint256 _key2) public view returns(uint256) {
        return nestedMapping[_key1][_key2];
    }
    function remove(uint256 _key1, uint256 _key2) public {
        delete nestedMapping[_key1][_key2];
    }
}