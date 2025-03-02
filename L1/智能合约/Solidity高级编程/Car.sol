//SPDX-License-Identifier: MIT
 pragma solidity ^0.8.24;
contract Car{
     uint256 private speed;
     event dirveEvent(uint256 speed);

    function dirve(uint256 _speed) public {
        speed = _speed;
      emit dirveEvent(speed);
    }
}
