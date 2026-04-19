// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract BasicBankV2 {
    /// used to store the balance of users
    ///     USER    =>  BALANCE
    mapping(address => uint256) public balances;

    /// @notice deposit ether into the contract
    /// @dev it should work properly when called multiple times
    function addEther() external payable {
        uint256 amount = msg.value;
        if (amount > 0) {
            balances[msg.sender] += amount;
        }
    }

    /// @notice used to withdraw ether from the contract
    /// @param amount of ether to remove. Cannot execeed balance i.e users cannot withdraw more than they deposited
    function removeEther(uint256 amount) external payable {
        require(amount > 0, "Amount should be greater than zero.");
        require(amount <= balances[msg.sender], "Not enough funds to withdraw.");
        balances[msg.sender] -= amount;
        (bool ok, ) = msg.sender.call{value: amount}("");
    }

}
