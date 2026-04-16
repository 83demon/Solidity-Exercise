// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract Mean {
    /**
     * The goal of this exercise is to return the mean of the numbers in "arr"
     */
    function mean(uint256[] calldata arr) public view returns (uint256) {
        uint256 mean = 0;
		uint256 len = arr.length;
		for (uint256 u=0; u < len; u++) {
			mean+= arr[u];
		}
		return mean / len;
    }
}
