// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Function {
    //多值返回
    function returnMany() public pure returns (uint256, bool, uint256) {
        return (1, true, 2);
    }

    // 可以命名返回值。
    function named() public pure returns (uint256 x, bool b, uint256 y) {
        return (1, true, 2);
    }

    // 可以将返回值分配给它们的名称。
    // 在这种情况下，return可以省略。
    function assigned() public pure returns (uint256 x, bool b, uint256 y) {
        x = 1;
        b = true;
        y = 2;
    }

    // 可以使用解构赋值。
    // 这是一种在函数调用时将返回值分配给变量的方法。
    function destructuringAssignments()
        public
        pure
        returns (uint256, bool, uint256, uint256, uint256)
    {
        (uint256 i, bool b, uint256 j) = returnMany();

        // 跳过值
        (uint256 x, , uint256 y) = (4, 5, 6);

        return (i, b, j, x, y);
    }

    // 数组参数
    function arrayInput(uint256[] memory _arr) public {}

    // 数组输出
    uint256[] public arr;

    function arrayOutput() public view returns (uint256[] memory) {
        return arr;
    }
}

// 键值对参数
contract XYZ {
    function someFuncWithManyInputs(
        uint256 x,
        uint256 y,
        uint256 z,
        address a,
        bool b,
        string memory c
    ) public pure returns (uint256) {
        return x + y + z;
    }
    // 函数调用
    function callFunc() external pure returns (uint256) {
        return someFuncWithManyInputs(1, 2, 3, address(0), true, "c");
    }
   // 函数调用 
    function callFuncWithKeyValue() external pure returns (uint256) {
        // 键值对参数
        return
            someFuncWithManyInputs({
                a: address(0),
                b: true,
                c: "c",
                x: 1,
                y: 2,
                z: 3
            });
    }
}
