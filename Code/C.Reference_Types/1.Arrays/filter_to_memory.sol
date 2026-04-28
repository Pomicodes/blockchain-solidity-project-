pragma solidity ^0.8.20;

contract Contract {
    function filterEven(uint[] calldata arr) external pure returns (uint[] memory) {
        uint count = 0;

        for (uint i = 0; i < arr.length; i++) {
            if (arr[i] % 2 == 0) {
                count++;
            }
        }

        uint[] memory result = new uint[](count);

        uint index = 0;
        for (uint i = 0; i < arr.length; i++) {
            if (arr[i] % 2 == 0) {
                result[index] = arr[i];
                index++;
            }
        }

        return result;
    }
}