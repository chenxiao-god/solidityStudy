// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract ArrayRemoveByShifting {

    uint256[] public nums = [1, 2, 3, 4, 5];
    // 删除数组元素
    function remove(uint256 _index) public {
        // 检查索引是否越界
        require(_index < nums.length, "index out of bounds"); 
        // 将数组元素向前移动
        for(uint256 i = _index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
        // 删除最后一个元素
        nums.pop();
    }
contract ArrayReplaceFormEnd {
    uint256[] public nums = [1, 2, 3, 4, 5];
    function remove(uint256 _index) public {
        // 检查索引是否越界
        require(_index < nums.length, "index out of bounds"); 
        // 将数组元素向前移动
        nums[_index] = nums[nums.length - 1];
        // 删除最后一个元素
        nums.pop();
    }
  
}
