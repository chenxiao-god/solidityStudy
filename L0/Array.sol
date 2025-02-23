// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Array {
    // 数组
    uint256[] public nums = [1, 2, 3];  
    // 动态数组
    uint256[] public nums2;
    // 固定长度数组
    uint256[3] public nums3 = [1, 2, 3];
   //  添加元素
    function push() public {
        nums.push(4);
        nums2.push(4);
        nums3.push(4);
    }
    // 删除数组最后一个元素
    function pop() public {
        nums.pop();
        nums2.pop();
        nums3.pop();
    }
    // 数组长度
    function length() public view returns(uint256) {
        return nums.length;
    }
    
}