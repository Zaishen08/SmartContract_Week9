// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import {myERC721Enumerable} from "../src/myERC721Enumerable.sol";
import {myERC721A} from "../src/myERC721A.sol";

contract ERC721ATest is Test {
    myERC721Enumerable public erc721;
    myERC721A public erc721a;
    uint256 public tokenId = 0;
    uint256 public mintQuantity = 100;
    address public owner = address(1);
    address public user1 = address(2);
    address public user2 = address(3);

    function setUp() public {
        vm.startPrank(owner);
        erc721 = new myERC721Enumerable("MY_ERC721", "MY_ERC721");
        erc721a = new myERC721A("MY_ERC721A", "MY_ERC721A");
        erc721.mint(user1);
        erc721a.mint(user1, 1);
        vm.stopPrank();

        vm.startPrank(user1);
        erc721.approve(owner, tokenId);
        erc721a.approve(owner, tokenId);
        vm.stopPrank();
    }

    function testErc721Mint() public {
        vm.startPrank(owner);
        for (uint i = 0; i < mintQuantity; i++) {
            erc721.mint(user1);
        }
        vm.stopPrank();
    }

    function testErc721aMint() public {
        vm.prank(owner);
        erc721a.mint(user1, mintQuantity);
    }

    function testErc721TransferFrom() public {
        vm.prank(owner);
        erc721.transferFrom(user1, user2, tokenId);
    }

    function testErc721aTransferFrom() public {
        vm.prank(owner);
        erc721a.transferFrom(user1, user2, tokenId);
    }

    function testErc721Approve() public {
        vm.prank(user1);
        erc721.approve(owner, tokenId);
    }

    function testErc721aApprove() public {
        vm.prank(user1);
        erc721a.approve(owner, tokenId);
    }
}