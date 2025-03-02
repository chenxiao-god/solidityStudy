//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract Fund {
    address private immutable owner = msg.sender;
    mapping(address => uint) private funderMapping;
    address[] private funderArr;
    uint256 private fundingGoal;
    uint256 private funders;
    uint256 private constant AMOUNT = 100000000000000000;
    uint256 private currentFunding;
    bool private status = false;

    constructor(uint256 _totalFunding) {
        fundingGoal = _totalFunding;
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
    function fund() public payable {
        require(status, "Funding is closed");
        require(msg.value == AMOUNT, "Amount must be 0.1 ETH");
        funderMapping[msg.sender] += AMOUNT;
        funders++;
        currentFunding += AMOUNT;
        // 如果当前资金大于目标资金，则将多余的资金退回
        if (fundingGoal > currentFunding) {
            payable(address(this)).transfer(fundingGoal - currentFunding);
        }
        funderArr.push(msg.sender);
    }

    function close() public onlyOwner {
        require(msg.sender == owner, "Only owner can close the fund");
        status = false;
    }
    function withdraw() public onlyOwner {
        require(msg.sender == owner, "Only owner can withdraw the fund");
        require(!status, "Funding is still open");
        payable(msg.sender).transfer(address(this).balance);
    }
    function getFunderArr() public view returns (address[] memory) {
        return funderArr;
    }
    function getFunderMapping(address _funder) public view returns (uint) {
        return funderMapping[_funder];
    }
    function getFundingGoal() public view returns (uint) {
        return fundingGoal;
    }
    function getFunders() public view returns (uint) {
        return funders;
    }
    function getCurrentFunding() public view returns (uint) {
        return currentFunding;
    }
}
