// SPDX-License-Identifier: MIT
// ERC721A Contracts v4.2.3
// Creator: Chiru Labs

pragma solidity ^0.8.4;

import {Ownable} from "openzeppelin-contracts/contracts/access/Ownable.sol";
import {ERC721Enumerable} from "openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import {ERC721} from "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract myERC721Enumerable is ERC721Enumerable, Ownable {
    constructor(
        string memory name_,
        string memory symbol_
    ) ERC721(name_, symbol_) {}

    function mint(address to) public onlyOwner {
        uint tokenId = totalSupply();
        _safeMint(to, tokenId);
    }
}