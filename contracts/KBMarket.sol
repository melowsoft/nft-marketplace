//SPDX-Lincense-Identifier: MIT
pragma solidity ^0.8.4;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/security/ReentrancyGuard.sol';
import '@openzeppelin/contracts/utils/Counters.sol';

// security against transactions for multiple requests

import 'hardhat/console.sol';

contract KBMarket is ReentrancyGuard {
    using Counters for Counters.Counter;

    /* number of items minting, number of transactions, tokens that have not been sold
      keep track of tokens total number - tokenId
     arrays need to know the length - help to keep tract for arrays */

     Counters.Counter private _tokenIds;
     Counters.Counter private _tokensSold;

    // determine who is the owner of the contract
    // charge a listing fee so the owner makes a commision

    address payable owner;
    // we are deploying the contract to matic the API is the same so you can use ether the same as matic
    // they both have 18 decimal places
    // 0.045 is in the cents
    uint256 listingPrice = 0.045 ether;

    constructor() {
        // set the owner
        owner = payable(msg.sender);
    }

    // struct can act like objects

    struct MarketToken {
        uint itenId;
        address nftContract;
        uint256 tokenId;
        address payable seller;
        address payable owner;
        uint256 price;
        bool sold;
    }

    // tokenId return which MarketToken - fetch which one it is

    mapping(uint256 => MarketToken) private idTokenItem;

    // listen to events from front end applications
    event MarketTokenMinted(
        uint indexed itemId,
        address indexed nftContract,
        uint256 indexed tokenId,
        address seller,
        address owner,
        bool sold
    );
}