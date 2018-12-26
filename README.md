
# Land Real Estate Registration

## Project Details

 - FIS SOLUTIONS(INDIA)
 - Web App development
 - Complex

> Land/Real estate registration is corruption prone process which leads
> to lot of Benami transactions. Government tries it's best to eradicate
> the malpractices, but it doesn't yield fruitful result. One way to
> solve this problem is to use blockchain technology in order to capture
> all the Benami transactions related to Land/Real estate deals.

## Contract Information

### LandRegistry.sol
**Contract Address :** 
`0xc1c1bb00b84f7b0c413cb267a321b4c018535c8f`

**Testnet Chain :** 
`Ropsten`

**ABI :**

    [{"constant":true,"inputs":[{"name":"_adr","type":"address"}],"name":"isCeo","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_validatorAddress","type":"address"}],"name":"setValidator","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_newOwner","type":"address"}],"name":"setOwner","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"getTransferLandTransactionsLength","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"getAddLandTransactionsLength","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_transactorAddress","type":"address"}],"name":"setTransactor","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_index","type":"uint256"}],"name":"getAddLandTransaction","outputs":[{"name":"index","type":"uint256"},{"name":"createdBy","type":"address"},{"name":"validators","type":"address[]"},{"name":"ownerAddress","type":"address"},{"name":"previousOwners","type":"address[]"},{"name":"coordinates","type":"bytes32[]"},{"name":"ownerName","type":"string"},{"name":"location","type":"bytes32"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_newLandOwner","type":"address"},{"name":"_newLandOwnerName","type":"string"},{"name":"_landIndex","type":"uint256"}],"name":"transferLandTransaction","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_role","type":"uint256"}],"name":"requestAccess","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_index","type":"uint256"}],"name":"validateAddLandTransaction","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_ownerAddress","type":"address"},{"name":"_coordinates","type":"bytes32[]"},{"name":"_ownerName","type":"string"},{"name":"_location","type":"bytes32"}],"name":"addLandTransaction","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_index","type":"uint256"}],"name":"validateTransferLandTransaction","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_adr","type":"address"}],"name":"isTransactor","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_index","type":"uint256"}],"name":"getRequest","outputs":[{"name":"","type":"uint256"},{"name":"","type":"address"},{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"getRequestsLength","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"getLandsLength","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_index","type":"uint256"}],"name":"approveRequest","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"getLandA","outputs":[{"components":[{"name":"ownerAddress","type":"address"},{"name":"previousOwners","type":"address[]"},{"name":"coordinates","type":"bytes32[]"},{"name":"ownerName","type":"string"},{"name":"location","type":"bytes32"}],"name":"l","type":"tuple[]"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_index","type":"uint256"}],"name":"getTransferLandTransaction","outputs":[{"name":"index","type":"uint256"},{"name":"landIndex","type":"uint256"},{"name":"newLandOwnerName","type":"string"},{"name":"createdBy","type":"address"},{"name":"newLandOwner","type":"address"},{"name":"validators","type":"address[]"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_index","type":"uint256"}],"name":"getLand","outputs":[{"name":"ownerAddress","type":"address"},{"name":"previousOwners","type":"address[]"},{"name":"coordinates","type":"bytes32[]"},{"name":"ownerName","type":"string"},{"name":"location","type":"bytes32"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_adr","type":"address"}],"name":"isValidator","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"}]

**Test Data:**

    "0x707aC3937A9B31C225D8C240F5917Be97cab9F20", ["0x70","0x78"],"Anudit","0xFF"
