// SPDX-License-Identifier: MIT
pragma solidity ^0.8 .8;

contract SimpleStorage {
    //boolean, uint, int, address, bytes

    //default uint bytes: 256
    //uint is init to 0

    // bool hasFavouriteNumber = true;
    // uint256 favouriteNumber = 5;
    // string favouriteNumberInText = "Five";
    // int256 favourite = -5;
    // address myAddress = 0xe08871d92f5B10B4b54F0145aebDa075C1461447;
    // bytes32 favouriteBytes = "cat";

    // default visibility specifier is "internal": only visible internally
    uint256 favouriteNumber;
    People public person = People({favouriteNumber: 45, name: "Shivam"});
    mapping(string => uint256) public nameToFavouriteNumber;

    //struct creates a custom data type
    struct People {
        uint256 favouriteNumber;
        string name;
    }

    //array of People struct
    People[] public people;

    function store(uint256 _favouriteNumber) public virtual {
        favouriteNumber = _favouriteNumber;
    }

    //view and pure dont spend gas unless called by the contract

    //view function doesnt allow modification of the state, cannot update anything in the contract. No Write
    function retrieve() public view returns (uint256) {
        return favouriteNumber;
    }

    //pure function doesnt allow reading anything from the blockchain. No read/Writes
    function add() public pure returns (uint256) {
        return 1 + 1;
    }

    //calldata, memory, storage
    //calldata: canot be modified and not on blockchain
    //memory: can be modified and not on blockchain
    //storage: data on the blockchain

    function addPerson(string memory _name, uint256 _number) public {
        //People memory newPerson = People({favouriteNumber:_number, name: _name});
        //people.push(newPerson);
        people.push(People(_number, _name));
        nameToFavouriteNumber[_name] = _number;
    }
}
