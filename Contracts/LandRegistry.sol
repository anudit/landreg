pragma solidity ^0.5.2;
pragma experimental ABIEncoderV2;
import "./AccessControl.sol";

contract LandRegistry is AccessControl {
    
    struct Land {
        address ownerAddress;
        address[] previousOwners;
        bytes32[] coordinates;
        string ownerName;
        bytes32 location;
    }
    
    struct AddLandTransaction {
        uint index;
        address createdBy;
        address[] validators;
        Land land;
    }
    
    struct TransferLandTransaction {
        uint index;
        uint landIndex;
        string newLandOwnerName;
        address createdBy;
        address newLandOwner;
        address[] validators;
    }
    
    mapping(address => uint[]) addressToLandIndexes;
    Land[] lands;
    AddLandTransaction[] addLandTransactions;
    TransferLandTransaction[] transferLandTransactions;
    uint requiredValidatorsLength = 1;
    
    function addLandTransaction(address _ownerAddress, bytes32[] memory _coordinates, string memory _ownerName, bytes32 _location) 
    public 
    onlyTransactor
    {
        Land memory land = Land({ 
            ownerAddress: _ownerAddress,
            previousOwners: new address[](0),
            coordinates: _coordinates,
            ownerName: _ownerName,
            location: _location
        }); 
        
        AddLandTransaction memory txn = AddLandTransaction({  
            index: addLandTransactions.length,
            createdBy: msg.sender,
            validators: new address[](0),
            land: land
        });
        
        addLandTransactions.push(txn);
    }

    function transferLandTransaction(address _newLandOwner, string memory _newLandOwnerName, uint _landIndex) 
    public 
    onlyTransactor
    {
        address[] memory validators;
        TransferLandTransaction memory txn = TransferLandTransaction({
            index: transferLandTransactions.length,
            landIndex: _landIndex,
            createdBy: msg.sender,
            newLandOwner: _newLandOwner,
            newLandOwnerName: _newLandOwnerName,
            validators: validators
        });
        transferLandTransactions.push(txn);
    }

    function validateAddLandTransaction(uint _index) public onlyValidator {
        AddLandTransaction storage txn = addLandTransactions[_index];
        for (uint i = 0; i < txn.validators.length; i++) {
            if (txn.validators[i] == msg.sender) {
                revert("This address is already a validator");
            }
        }
        
        txn.validators.push(msg.sender);

        if (txn.validators.length == requiredValidatorsLength) {
            addLand(txn);
        }
    }   

    function validateTransferLandTransaction(uint _index) public onlyValidator {
        TransferLandTransaction storage txn = transferLandTransactions[_index];
        for (uint i = 0; i < txn.validators.length; i++) {
            if (txn.validators[i] == msg.sender) {
                revert("This address is already a validator");
            }
        }

        txn.validators.push(msg.sender);

        if (txn.validators.length == requiredValidatorsLength) {
            transferLand(txn);
        }
    }

    function getAddLandTransaction(uint _index) public view onlyValidator returns (
        uint index,
        address createdBy, 
        address[] memory validators,
        address ownerAddress,
        address[] memory previousOwners,
        bytes32[] memory coordinates,
        string memory ownerName,
        bytes32 location
    ) {
        AddLandTransaction memory txn = addLandTransactions[_index];
        Land memory land = txn.land;
        return (
        txn.index, txn.createdBy, txn.validators, land.ownerAddress, 
        land.previousOwners, land.coordinates, land.ownerName, land.location
        );
    }

    function getTransferLandTransaction(uint _index) public view onlyValidator returns (
        uint index,
        uint landIndex,
        string memory newLandOwnerName,
        address createdBy,
        address newLandOwner,
        address[] memory validators
    ) {
        TransferLandTransaction memory txn = transferLandTransactions[_index];
        return (txn.index, txn.landIndex, txn.newLandOwnerName, txn.createdBy, txn.newLandOwner, txn.validators);
    }

    function getAddLandTransactionsLength() public view returns (uint) {
        return addLandTransactions.length;
    }

    function getTransferLandTransactionsLength() public view returns (uint) {
        return transferLandTransactions.length;
    }

    function getLandsLength() public view returns (uint) {
        return lands.length;
    }

    function getLand(uint _index) public view onlyTransactor returns (
        address ownerAddress,
        address[] memory previousOwners,
        bytes32[] memory coordinates,
        string memory ownerName,
        bytes32 location
    ) {
        Land memory land = lands[_index];
        return (land.ownerAddress, land.previousOwners, land.coordinates, (land.ownerName), land.location);
    }
    
    function getLandA() public view onlyTransactor returns (
        Land[] memory l
    ) {
        return (lands);
    }
    
    function addLand(AddLandTransaction storage _transaction) internal onlyValidator {
        require(_transaction.validators.length >= requiredValidatorsLength, "Transfer land needs at least two validators");
        //AddLandTransaction storage lastTransaction = addLandTransactions[addLandTransactions.length - 1];
        //lastTransaction.index = _transaction.index;   
        //addLandTransactions[_transaction.index] = lastTransaction;
        //addLandTransactions.length--;
        lands.push(_transaction.land);
        delete addLandTransactions[addLandTransactions.length - 1]; 
        addLandTransactions.length--;
    }

    function transferLand(TransferLandTransaction storage _transaction) internal onlyValidator {
        require(_transaction.validators.length >= requiredValidatorsLength, "Transfer land needs at least two validators");
        TransferLandTransaction storage lastTransaction = transferLandTransactions[transferLandTransactions.length - 1]; 
        lastTransaction.index = _transaction.index;
        transferLandTransactions[_transaction.index] = lastTransaction;
        delete transferLandTransactions[transferLandTransactions.length - 1];
        transferLandTransactions.length--;
        lands[_transaction.landIndex].previousOwners.push(lands[_transaction.landIndex].ownerAddress);
        lands[_transaction.landIndex].ownerAddress = _transaction.newLandOwner;
        lands[_transaction.landIndex].ownerName = _transaction.newLandOwnerName;
    }
}