pragma solidity ^0.5.2;

contract AccessControl {
    address owner;
    mapping(address => bool) validators;
    mapping(address => bool) transactors;
    RequestAccessTransaction[] requestAccessTransactions;

    struct RequestAccessTransaction {
        uint index;
        uint roleRequested;        
        address requesterAddress;
    }

    enum Roles {
        VALIDATOR,
        TRANSACTOR
    }
    
    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Sender address is not owner");
        _;
    }

    modifier onlyValidator() {
        require(validators[msg.sender] == true || msg.sender == owner, "Sender address is not registered as validator");
        _;
    }
    
    modifier onlyTransactor() {
        require(
            transactors[msg.sender] == true || validators[msg.sender] == true || owner == msg.sender, "Sender address is not registered as transactor");
        _;
    }

    function requestAccess(uint _role) public  {
        RequestAccessTransaction memory txn = RequestAccessTransaction({ 
            index: requestAccessTransactions.length,
            roleRequested: _role,
            requesterAddress: msg.sender
        });
        requestAccessTransactions.push(txn);
    }

    function approveRequest(uint _index) public onlyValidator {
        RequestAccessTransaction storage txn = requestAccessTransactions[_index];
        if (txn.roleRequested == uint(Roles.VALIDATOR)) {
            setValidator(txn.requesterAddress);
            delete requestAccessTransactions[_index];
            requestAccessTransactions.length--;
        } else if (txn.roleRequested == uint(Roles.TRANSACTOR)) {
            setTransactor(txn.requesterAddress);
            delete requestAccessTransactions[_index];
            requestAccessTransactions.length--;
        } else {
            revert("Role applied does not exist");
        }
    }

    function getRequest(uint _index) public view returns (
        uint,
        address,
        uint
    ) {
        RequestAccessTransaction memory txn = requestAccessTransactions[_index];
        return (txn.index, txn.requesterAddress, txn.roleRequested);
    }

    function getRequestsLength() public view returns (uint) {
        return requestAccessTransactions.length;
    }

    function setOwner(address _newOwner) public onlyOwner {
        owner = _newOwner;
    }

    function setValidator(address _validatorAddress) public onlyOwner {
        validators[_validatorAddress] = true;
    }
    
    function setTransactor(address _transactorAddress) public onlyOwner onlyValidator {
        transactors[_transactorAddress] = true;
    }

    function isValidator(address _adr) public view returns (bool) {
        return validators[_adr];
    }

    function isTransactor(address _adr) public view returns (bool) {
        return transactors[_adr];
    }

    function isCeo(address _adr) public view returns (bool) {
        return owner == _adr;
    }

}