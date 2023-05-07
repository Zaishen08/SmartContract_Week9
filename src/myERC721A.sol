// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import {Ownable} from "openzeppelin-contracts/contracts/access/Ownable.sol";
import {ERC721A} from "./ERC721A.sol";

contract myERC721A is ERC721A, Ownable {
    constructor(
        string memory name_,
        string memory symbol_
    ) ERC721A(name_, symbol_) {}

    function mint(address to, uint256 quantity) public onlyOwner {
        _mint(to, quantity);
    }
}