pragma solidity ^0.8.9;

import "hardhat/console.sol";
contract SimpleContract {
    string public message;
    
    constructor(string memory initialMessage) {
        message = initialMessage;
    }
    
    function setMessage(string memory newMessage) public {
        console.log("This smart contract's constructor was initialised with messafe %o . You can set your new message here with this function", message);
        message = newMessage;
    }
}