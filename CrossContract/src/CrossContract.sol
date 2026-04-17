// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract CrossContract {
    /**
     * The function below is to call the price function of PriceOracle1 and PriceOracle2 contracts below and return the lower of the two prices
     */

    function getLowerPrice(
        address _priceOracle1,
        address _priceOracle2
    ) external returns (uint256) {	
		require(_priceOracle1.code.length > 0, "there is no code at address of first oracle.");
		require(_priceOracle2.code.length > 0, "there is no code at address of second oracle.");

		bytes memory encodedData = abi.encodeWithSignature("price()");

		(bool oracle1Status, bytes memory oracle1Result) = _priceOracle1.call(encodedData);
		require(oracle1Status, "Call to first oracle failed.");

		(bool oracle2Status, bytes memory oracle2Result) = _priceOracle2.call(encodedData);
		require(oracle2Status, "Call to second oracle failed.");

		uint256 oracle1Price = abi.decode(oracle1Result, (uint256));
		uint256 oracle2Price = abi.decode(oracle2Result, (uint256));
		
		return min(oracle1Price, oracle2Price);
    }

	function min(uint256 first, uint256 second) public pure returns (uint256) {
		if (first >= second) {return second;}
		else { return first;}
	}
}

contract PriceOracle1 {
    uint256 private _price;

    function setPrice(uint256 newPrice) public {
        _price = newPrice;
    }

    function price() external view returns (uint256) {
        return _price;
    }
}

contract PriceOracle2 {
    uint256 private _price;

    function setPrice(uint256 newPrice) public {
        _price = newPrice;
    }

    function price() external view returns (uint256) {
        return _price;
    }
}
