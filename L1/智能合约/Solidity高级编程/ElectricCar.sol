// SPDX-License-Identifier: MIT
 pragma solidity ^0.8.24;
import "./Car.sol";
 contract ElectricCar is Car{
    uint256 private battery;  
    event chargeEvent(uint256 battery);
    function charge(uint256 _battery) public{
        battery = _battery;
        emit chargeEvent(battery);
    }
    function dirve(uint256 _speed) public override{
        require(battery > 0, "battery is not enough");
        battery -= 1;
        super.dirve(_speed);
    }
 }