// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract FilterOddNumbers {
    /*
        This exercise assumes you understand how to manipulate Array.
        1. Function `filterOdd` takes an array of uint256 as argument. 
        2. Filter and return an array with the odd numbers removed.
        Note: this is tricky because you cannot allocate a dynamic array in memory, 
              you need to count the even numbers then declare an array of that size.
    */

    function filterOdd(uint256[] memory _arr)
        public
        view
        returns (uint256[] memory)
    {
        uint256 evenNumCounter = 0;
		uint256 arrLen = _arr.length;	

		for (uint256 i=0; i < arrLen; i++) {
			if (_arr[i] % 2 == 0) {
				evenNumCounter++;
			}
		}
		uint256 posCounter = 0;	
		uint256[] memory filteredArr = new uint256[](evenNumCounter);
		for (uint256 i=0; i < arrLen; i++) {
			uint256 numCandidate = _arr[i];
			if (numCandidate % 2 == 0) {
				filteredArr[posCounter] = numCandidate;
				posCounter++;
        	}
		}
		return filteredArr;

    }
}
