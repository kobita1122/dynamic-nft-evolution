// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DynamicNFT is ERC721URIStorage, Ownable {
    uint256 private _nextTokenId;
    
    // Mapping from token ID to its current evolution stage
    mapping(uint256 => uint256) public tokenStage;
    
    // Array of metadata URIs representing different evolution stages
    string[] public stageURIs;

    constructor(string[] memory _initialURIs) 
        ERC721("EvolutionNFT", "EVO") 
        Ownable(msg.sender) 
    {
        stageURIs = _initialURIs;
    }

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, stageURIs[0]);
        tokenStage[tokenId] = 0;
    }

    // Function to evolve the NFT to the next stage
    function evolve(uint256 tokenId) public onlyOwner {
        uint256 currentStage = tokenStage[tokenId];
        require(currentStage + 1 < stageURIs.length, "Max evolution reached");
        
        uint256 newStage = currentStage + 1;
        tokenStage[tokenId] = newStage;
        _setTokenURI(tokenId, stageURIs[newStage]);
    }

    function updateStageURIs(string[] memory _newURIs) public onlyOwner {
        stageURIs = _newURIs;
    }
}
