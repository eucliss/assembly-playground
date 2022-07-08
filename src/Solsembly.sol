pragma solidity ^0.8.0;

contract Solsembly {

    uint256 public storageSlot1;
    address public owner;
    string public message;

    constructor() {
    }

    function name() external pure returns (string memory) {
        // Return the name of the contract.
        assembly {
            // Store 32 in memory location 0
            mstore(0, 0x20)
            // Store (09 + Solsembly) in memory location 41, len and name combined
            mstore(0x29, 0x09536f6c73656d626c79)
            // Return starting at memory location 0
            return(0, 0x60)
        }
    }

    function exponential(uint exponent, uint base) public pure returns (uint) {
         
        assembly {
            let originalValue := base
            for { let i := 1 } lt(i, exponent) { i := add(i, 1) } { 
                base := mul(originalValue, base) 
            }
            mstore(0x0, base)
            return(0x0, 32)
        }   
    }

    function easyExponent(uint exponent, uint base) public pure returns (uint) {
         
        assembly {
            mstore(0x0, exp(base, exponent))
            return(0x0, 32)
        }   
    }

   function setStorageSlot1(uint256 val) public returns (uint256){
        assembly {
            // Store val in the first storage slot (storageSlot1)
            sstore(0x0, val)
            // store val in memory at location 0
            mstore(0x0, val)
            // return 32 bytes at location 0
            return(0x0, 0x20)
        } 

        // Optional path, return directly from storageSlot1
        // return from storage slot
        // return storageSlot1;
    }

    // Return 1 if there is a remainder from division, 0 if not
    function remainderDivision(uint256 numerator, uint256 denominator) public pure returns(uint256) {
      assembly {
        // 0x40 stores the location of the free mem
          let res:= mload(0x40)
            // If remainder, return 1
          if mulmod(numerator, 1, denominator) {
              mstore(res, 1)
              return(res, 0x20)
          }
          mstore(res, 0)
          return(res, 0x20)
      }
    }

    // Assembly conditional, switch on val, if 10 => 50, if 1 => 5, else 100
    function switchAssembly(uint val) public pure returns (uint res) {
        assembly {
            switch val
            case  10 {
                res := 50
            }
            case 1 { 
                res := 5
            }
            default {
                res := 100
            }
        }
    }

    // Assembly return
    function returnSimpleAssembly(uint val) public pure returns (uint) {
        assembly {
            // Get location of free memory
            let _ptr := mload(0x40)
            // Store value at free memory location
            mstore(_ptr, val)
            // Return 32 bytes from that location
            return(_ptr, 0x20)
        }
    }

    /*
     * Assembly Revert and Custom Errors
     */

}