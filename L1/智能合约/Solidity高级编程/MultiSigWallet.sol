// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract MultiSigWallet {
   // 多签人员
    address[] public owners;
    // 是否是多签人员
    mapping(address => bool) public isOwner;
    // 确认数
    uint256 public required;
    // 交易
    struct Transaction {
        address to;
        uint value;
        bytes data;
        bool executed;
    }
    // 交易数组
    Transaction[] public transactions;
    // 被确认的交易
    mapping(uint => mapping(address => bool)) public confirmations;
    // 交易数量
    uint public transactionCount;
    event Deposit(address indexed sender, uint amount);
    event Submit(uint indexed txId);
    event Confirm(uint indexed txId, address indexed sender);
    event Execute(uint indexed txId);
    // 判断是否是多签人员
    modifier onlyOwner() {
        require(isOwner[msg.sender], "Not owner");
        _;
    }
    // 判断是否是交易
    modifier txExists(uint _txId) {
        require(_txId < transactionCount, "Tx does not exist");
        _;
    }
    // 判断是否是未确认交易
    modifier notConfirmed(uint _txId) {
        require(!confirmations[_txId][msg.sender], "Already confirmed");
        _;
    }
    // 判断是否是未执行交易
    modifier notExecuted(uint _txId) {
        require(!transactions[_txId].executed, "Already executed");
        _;
    }

    constructor(address[] memory _owners, uint _required) {
        require(_owners.length > 0, "Owners required");
        require(
            _required > 0 && _required <= _owners.length,
            "Invalid requirement"
        );
        for (uint i = 0; i < _owners.length; i++) {
            address owner = _owners[i];
            require(owner != address(0), "Invalid owner");
            require(!isOwner[owner], "Owner not unique");
            isOwner[owner] = true;
            owners.push(owner);
        }
        required = _required;
    }
   // 接收以太币
    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }
    // 提交交易
    function submit(address _to, uint _value, bytes calldata _data) public onlyOwner {
        uint txId = transactionCount; 
        transactions.push(Transaction({
            to: _to,
            value: _value,
            data: _data,
            executed: false
        }));
        transactionCount++;
        emit Submit(txId);
    }
    // 确认交易
    function confirm(uint _txId) public onlyOwner txExists(_txId) notConfirmed(_txId) notExecuted(_txId) {
        confirmations[_txId][msg.sender] = true;
        emit Confirm(_txId, msg.sender);
    }
    // 执行交易
    function execute(uint _txId) public onlyOwner txExists(_txId) notExecuted(_txId) {
        uint confirmationsCount = getConfirmationsCount(_txId);
        require(confirmationsCount >= required, "Confirmations < required");
        Transaction storage transaction = transactions[_txId];
        transaction.executed = true;
        (bool success, ) = transaction.to.call{value: transaction.value}(transaction.data);
        require(success, "Transaction failed");
        emit Execute(_txId);
    }
   function getConfirmationsCount(uint _txId) public view returns (uint count) {
        for (uint i = 0; i < owners.length; i++) {
            if (confirmations[_txId][owners[i]]) {
                count += 1;
            }
        }
    }
  


}