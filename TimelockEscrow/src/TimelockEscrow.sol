// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract TimelockEscrow {
    address public seller;
	address private buyer;
	uint256 endTime;
	bool isEscrowActive;

    /**
     * The goal of this exercise is to create a Time lock escrow.
     * A buyer deposits ether into a contract, and the seller cannot withdraw it until 3 days passes. Before that, the buyer can take it back
     * Assume the owner is the seller
     */

    constructor() {
        seller = msg.sender;
    }

    
    /**
     * creates a buy order between msg.sender and seller
     * escrows msg.value for 3 days which buyer can withdraw at anytime before 3 days but afterwhich only seller can withdraw
     * should revert if an active escrow still exist or last escrow hasn't been withdrawn
     */
    function createBuyOrder() external payable {
		require(!isEscrowActive, "No active escrow should exist.");
		require(msg.value > 0, "Escrow should be non-zero.");
		isEscrowActive = true;
    	endTime = block.timestamp + 3 days; 
		buyer = msg.sender;
    }

    /**
     * allows seller to withdraw after 3 days of the escrow with @param _buyer has passed
     */
    function sellerWithdraw(address _buyer) external {
		require(seller==msg.sender, "Only seller is allowed to call this.");
		require(isEscrowActive, "An active escrow should exist.");
        require(block.timestamp > endTime, "3 days should have passed.");
		require(buyer==_buyer, "Buyers must coincide.");

		isEscrowActive = false;
		(bool ok, ) = seller.call{value: address(this).balance}("");
		require(ok, "Seller withdraw failed.");
    }

    /**
     * allows buyer to withdraw at anytime before the end of the escrow (3 days)
     */
    function buyerWithdraw() external {
		require(msg.sender==buyer, "Only buyer is allowed to call this.");
        require(isEscrowActive, "An active escrow should exist.");
		require(block.timestamp < endTime, "3 days should not have passed.");

		isEscrowActive = false;
		(bool ok, ) = buyer.call{value: address(this).balance}("");
		require(ok, "Buyer withdraw failed.");
    }

    // returns the escrowed amount of @param _buyer
    function buyerDeposit(address _buyer) external view returns (uint256) {
        require(buyer==_buyer, "Buyers must coincide.");
        return address(this).balance;
    }
}
