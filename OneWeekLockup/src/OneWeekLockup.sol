// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract OneWeekLockup {
    /**
     * In this exercise you are expected to create functions that let users deposit ether
     * Users can also withdraw their ether (not more than their deposit) but should only be able to do a week after their last deposit
     * Consider edge cases by which users might utilize to deposit ether
     *
     * Required function
     * - depositEther()
     * - withdrawEther(uint256 )
     * - balanceOf(address )
     */

	// address points to the (uint256 value, uint256 lastDepositedAt) tuple.
	struct BalanceData {
    	uint256 amount;
    	uint256 lastUpdate;
	}

	mapping(address => BalanceData) public balances;

    function balanceOf(address user) public view returns (uint256) {
        return balances[user].amount;
    }

    function depositEther() external payable {
		balances[msg.sender].amount += msg.value;
    }

    function withdrawEther(uint256 amount) external {
        BalanceData storage balance = balances[msg.sender];
		require(balance.amount >= amount, "Not enough funds to withdraw.");
		require(balance.lastUpdate + 1 weeks < block.timestamp, "Too early to withdraw.");
		balance.amount -= amount;
		balance.lastUpdate = block.timestamp;

		(bool ok, ) = msg.sender.call{value: amount}("");
		require(ok, "Failed to withdraw.");
    }
}
