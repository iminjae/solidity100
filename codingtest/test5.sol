// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 < 0.9.0;

import "@openzeppelin/contracts/utils/Strings.sol";

contract TEST5 {
    /*
        숫자를 시분초로 변환하세요.
        예) 100 -> 1 min 40 sec
        600 -> 10min 
        1000 -> 16min 40sec
        5250 -> 1hour 27min 30sec
    */

    function time(uint _num) public pure returns(string memory) {
        

        uint hour = _num / 3600;
        uint min = (_num % 3600) / 60;
        uint sec = _num % 60;


        return string(abi.encodePacked(Strings.toString(hour), "hour", Strings.toString(min), "min", Strings.toString(sec), "sec"));

    }

}