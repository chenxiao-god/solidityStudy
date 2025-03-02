//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract SimpleShopping {
    struct product {
        uint256 id;
        string name;
        uint256 price;
    }
    struct userInfo {
        string name;
        address addr;
        uint256 age;
        string email;
    }
    struct order {
        uint256 id;
        userInfo user;
        uint256 num;
        uint256 time;
        string status;
    }
    address private owner;
    order[] private orderArray;
    product[] private productArray;
    mapping(uint256 => product) private productMapping;
    mapping(string => bool) private nameMapping;
    mapping(uint256 => uint256) private stockMapping;
    mapping(uint256 => order) private orderMapping;
    uint256 private cancelTime;
    event addProductSubjectEvent(
        uint256 id,
        string name,
        uint256 price,
        uint256 stock
    );
    event addOrderEvent(
        uint256 id,
        userInfo user,
        uint256 num,
        uint256 time,
        string status
    );
    event cancelOrderEvent(
        uint256 id,
        userInfo user,
        uint256 num,
        uint256 time,
        string status
    );
    constructor(address _owner) {
        owner = _owner;
        cancelTime = 7 days;
    }
    //获取订单ID
    function getRandomNumber() public view returns (uint256) {
        // 使用 block.prevrandao 替代 block.difficulty
        return
            uint256(
                keccak256(abi.encodePacked(block.prevrandao, block.timestamp))
            );
    }
    // 获取库存量
    function getStockByMapping(uint256 _id) public view returns (uint256) {
        return stockMapping[_id];
    }
    //增加库存
    function addStock(uint256 _id, uint256 _stock) public onlyOwner {
        stockMapping[_id] += _stock;
    }
    // 获取产品信息
    function getProductInfoById(
        uint256 _id
    ) public view returns (product memory) {
        return productMapping[_id];
    }
    // 获取全部产品信息
    function getAllProductInfo() public view returns (product[] memory) {
        return productArray;
    }
    //增加产品种类
    function addProductSubject(
        product memory _product,
        uint256 _stock
    ) public onlyOwner {
        require(nameMapping[_product.name], "name is exist");
        productMapping[_product.id] = _product;
        nameMapping[_product.name] = true;
        stockMapping[_product.id] = _stock;
        productArray.push(_product);
        emit addProductSubjectEvent(
            _product.id,
            _product.name,
            _product.price,
            _stock
        );
    }
    // 下单
    function addOrder(
        uint256 _id,
        uint256 _num,
        userInfo calldata _userInfo
    ) public {
        require(stockMapping[_id] >= _num, "stock is not enough");
        require(_num > 0, "num is not enough");
        stockMapping[_id] -= _num;
        uint256 id = getRandomNumber();
        uint256 time = block.timestamp;
        order memory _order = order({
            id: id,
            user: _userInfo,
            num: _num,
            time: time,
            status: "success"
        });
        orderArray.push(_order);
        orderMapping[id] = _order;
        // 向管理员转账
        payable(owner).transfer(_num * productMapping[_id].price);
        emit addOrderEvent(id, _userInfo, _num, time, "success");
    }

    // 取消订单
    function cancelOrder(uint256 _id) public {
        require(orderMapping[_id].num > 0, "order is not exist");
        require(
            orderMapping[_id].user.addr == msg.sender,
            "you are not the owner"
        );
        require(
            block.timestamp - orderMapping[_id].time < cancelTime,
            "cancel time is out"
        );
        stockMapping[orderMapping[_id].id] += orderMapping[_id].num;
        orderMapping[_id].num = 0;
        orderMapping[_id].status = "cancel";
        // 向用户转账
        payable(msg.sender).transfer(
            orderMapping[_id].num * productMapping[orderMapping[_id].id].price
        );
        emit cancelOrderEvent(
            _id,
            orderMapping[_id].user,
            orderMapping[_id].num,
            orderMapping[_id].time,
            "cancel"
        );
    }
    //
    modifier onlyOwner() {
        require(msg.sender == owner, "you are not the owner");
        _;
    }
}
