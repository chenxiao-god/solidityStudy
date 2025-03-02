// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "./Todo.sol";
contract Todos {
    // 数组
    Todo[] public todos;

    function create(string calldata _text) public {
        // 向数组中添加一个元素
        todos.push(Todo(_text, false));
        todos.push(Todo({text: _text, completed: false}));
        // 声明一个结构体变量
        Todo memory todo;
        todo.text = _text;
        todo.completed = false;
        todos.push(todo);
    }
    function update(uint256 _index, string calldata _text) public {
        // 修改数组中的元素
        todos[_index].text = _text;
    }
    function toggleCompleted(uint256 _index) public {
        // 修改数组中的元素
        todos[_index].completed = !todos[_index].completed;
    }
    function get(uint256 _index) public view returns(string memory, bool) {
        // 获取数组中的元素
        return (todos[_index].text, todos[_index].completed);
      
    }
}
