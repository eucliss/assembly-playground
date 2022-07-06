pragma solidity ^0.8.0;

import "ds-test/test.sol";
import {Solsembly} from "../Solsembly.sol";
import {CheatCodes} from "./utils/CheatCodes.sol";

contract ContractTest is DSTest {
    Solsembly public c; 
    CheatCodes cheats = CheatCodes(HEVM_ADDRESS);


    function setUp() public {
        c = new Solsembly();
    }

    function testName() public {
        string memory name = c.name();
        assertEq(name, "Solsembly");
    }

    function testRemainder() public {
        uint256 res = c.remainderDivision(10,2);
        assertEq(res, 0);
        res = c.remainderDivision(11, 2);
        assertEq(res, 1);
    }

    function testStorageSlot1Storage() public {
        uint256 res = c.setStorageSlot1(0xFFF);
        assertEq(res, 0xFFF);
        assertEq(c.storageSlot1(), 0xFFF);
    }

    function testExponential() public {
        uint256 res = c.exponential(3, 3);
        assertEq(res, 0x1B);
        res = c.exponential(5, 2);
        assertEq(res, 0x20);
    }


}