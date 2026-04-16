// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract IsSorted {
    /**
     * The goal of this exercise is to return true if the members of "arr" is sorted (in ascending order) or false if its not.
     */
    function isSorted(uint256[] calldata arr) public view returns (bool) {
		uint256 len = arr.length;
		if (len <= 1) {return true;}
		uint256 prevNum = arr[0];
		uint256 currNum;

        for (uint256 i=0; i < len - 1; i++) {
			currNum = arr[i+1];
			if (prevNum > currNum) {return false;}	
			prevNum = currNum;
		}
		return true;
    }
}
