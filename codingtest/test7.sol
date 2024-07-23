// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 < 0.9.0;

contract TEST7 {
    /*
        * 악셀 기능 - 속도를 10 올리는 기능, 악셀 기능을 이용할 때마다 연료가 20씩 줄어듬, 연료가 30이하면 더 이상 악셀을 이용할 수 없음, 속도가 70이상이면 악셀 기능은 더이상 못씀
        * 주유 기능 - 주유하는 기능, 주유를 하면 1eth를 지불해야하고 연료는 100이 됨
        * 브레이크 기능 - 속도를 10 줄이는 기능, 브레이크 기능을 이용할 때마다 연료가 10씩 줄어듬, 속도가 0이면 브레이크는 더이상 못씀
        * 시동 끄기 기능 - 시동을 끄는 기능, 속도가 0이 아니면 시동은 꺼질 수 없음
        * 시동 켜기 기능 - 시동을 켜는 기능, 시동을 키면 정지 상태로 설정됨
        --------------------------------------------------------
        * 충전식 기능 - 지불을 미리 해놓고 추후에 주유시 충전금액 차감 
    */

    uint speed;
    uint fuel;
    bool engine;
    uint fuelCard;

    constructor() {
        speed = 0;
        fuel = 100;
        engine = false;
        fuelCard = 0;
    }

    function chkCar() public view returns(uint, uint, bool, uint) {
        return (speed, fuel, engine, fuelCard);
    }

    //악셀 기능 - 속도를 10 올리는 기능, 악셀 기능을 이용할 때마다 연료가 20씩 줄어듬, 연료가 30이하면 더 이상 악셀을 이용할 수 없음, 속도가 70이상이면 악셀 기능은 더이상 못씀
    function axel() public {
        require(engine, "engine start");
        require(fuel >= 30, "empty fuel");
        require(speed >= 70, "max speed");

        speed += 10;
        fuel -= 20;
    }


    //* 주유 기능 - 주유하는 기능, 주유를 하면 1eth를 지불해야하고 연료는 100이 됨
    function reFuel() public payable {
        
        require(fuel == 100, "already max");

        if(fuelCard >= 1){
            fuelCard -= 1;
            
        }else{
            require(msg.value == 1 ether, "1 ether");
            fuel = 100;
        }

    }

    //브레이크 기능 - 속도를 10 줄이는 기능, 브레이크 기능을 이용할 때마다 연료가 10씩 줄어듬, 속도가 0이면 브레이크는 더이상 못씀
    function brake() public {
        require(engine, "engine start");
        require(speed == 0, "speed 0");
        require(fuel == 0, "empty fuel");

        speed -= 10;
        fuel -= 10;
    }


    //시동 끄기 기능 - 시동을 끄는 기능, 속도가 0이 아니면 시동은 꺼질 수 없음
    function turnOff() public  {
        require(speed != 0, "stop");

        engine = false;
    }

    //시동 켜기 기능 - 시동을 켜는 기능, 시동을 키면 정지 상태로 설정됨
    function turnOn() public {

        engine = true;
        speed = 0;
    }

    //충전식 기능 - 지불을 미리 해놓고 추후에 주유시 충전금액 차감
    function buyFuelCard() public payable {
        require(msg.value == 1 ether, "1 ether");

        fuelCard ++;
    }

}