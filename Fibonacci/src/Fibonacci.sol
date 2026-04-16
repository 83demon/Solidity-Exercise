// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract Fibonacci {
    /*
        This exercise assumes you understand what Fibonacci sequence is.
        1. Function `fibonacci` takes a uint256 as argument and returns nth fibonacci number.
        
        Fibonacci sequence are 0,1,1,2,3,5,8,13,....
        
        calling fibonacci(6) would return 8, because the 6th Fibonacci number is 8.
    */

    function fibonacci(uint256 _position) public view returns (uint256) {
        uint n_2 = 0;
		uint n_1 = 1;
		uint n_0 = 1;

		for (uint i=1; i < _position; i++) {
			n_0 = n_2 + n_1;
			n_2 = n_1;
			n_1 = n_0;	
		}

		return n_0;
    }
}
