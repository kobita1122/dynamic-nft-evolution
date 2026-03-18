# Dynamic NFT Evolution

This repository provides a standard for **Dynamic NFTs (dNFTs)**. Unlike static NFTs, these tokens can change their properties, image, or metadata based on external conditions or user interaction.

## Core Features
* **State-Based Metadata:** Uses a `stage` variable to determine which metadata URI to return.
* **Access Control:** Securely restricts update functions to authorized addresses or Oracles.
* **OpenZeppelin Standard:** Built on top of the battle-tested ERC-721 implementation.

## Architecture
The contract tracks a `Level` for each token. As the level increases, the `tokenURI` function dynamically computes a new metadata link, allowing the NFT to "evolve" (e.g., a character leveling up in a game).

## Quick Start
1.  Deploy `DynamicNFT.sol`.
2.  Mint a token using `safeMint(address to)`.
3.  Update the stage using `evolve(uint256 tokenId)` to change the metadata.
