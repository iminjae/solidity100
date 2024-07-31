// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 < 0.9.0;

contract Q81 {
    /*
        Contract에 예치, 인출할 수 있는 기능을 구현하세요.
        지갑 주소를 입력했을 때 현재 예치액을 반환받는 기능도 구현하세요.
    */

    mapping(address => uint) balance;

    function deposit() public payable{
        require(msg.value > 0);

        balance[msg.sender] += msg.value;
    }

    function withdraw(uint _amount) public {
        require(balance[msg.sender] >= _amount, "no balance");

        balance[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }

    function returnDeposit(address _address) public {
        uint amount = balance[_address];
        require(amount > 0, "No balance");

        balance[_address] = 0;
        payable(_address).transfer(amount);
    }

}

contract Q82 {
    /*
        특정 숫자를 입력했을 때 그 숫자까지의 3,5,8의 배수의 개수를 알려주는 함수를 구현하세요.
    */

    function A(uint a) public pure returns(uint, uint, uint) {
        
        uint cnt3 = 0;
        uint cnt5 = 0;
        uint cnt8 = 0;

        //1 2 3 4 5 6 7 8 9
        for(uint i = 1; i < a; i++){
            
            if(i % 3 == 0){
                cnt3 ++;
            } else if(i % 5 == 0){
                cnt5 ++;
            } else if(i % 8 == 0) {
                cnt8 ++;
            }
        }

        return (cnt3, cnt5, cnt8);
    }
}

contract Q83 {
    /*
        이름, 번호, 지갑주소 그리고 숫자와 문자를 연결하는 mapping을 가진 구조체 사람을 구현하세요.
        사람이 들어가는 array를 구현하고 array안에 push 하는 함수를 구현하세요.
    */
    
    struct Person {
        string name;
        uint number;
        address adres;
        mapping(uint => string) mp;
    }

    Person[] persons;

    function setPerson(string memory _name, uint _number, address _adres, uint _mp, string memory _mp2) public {
        
        persons.push();
        Person storage newPerson = persons[persons.length - 1];
        newPerson.name = _name;
        newPerson.number = _number;
        newPerson.adres = _adres;
        newPerson.mp[_mp] = _mp2;
    }
}

contract Q84 {
    /*
        2개의 숫자를 더하고, 빼고, 곱하는 함수들을 구현하세요.
        단, 이 모든 함수들은 blacklist에 든 지갑은 실행할 수 없게 제한을 걸어주세요.
    */

    mapping(address => bool) isBlacklist;

    function addBlackList(address adres) public {
        
        isBlacklist[adres] = true;
    }


    modifier blacklistChk {
        require(isBlacklist[msg.sender] == true , "nope");
        _;
    }

    function add(uint a, uint b)public view blacklistChk returns(uint){
        return a + b;
    }

    function sub(uint a, uint b)public view blacklistChk returns(uint){
        return a - b;
    }

    function mul(uint a, uint b)public view blacklistChk returns(uint){
        return a * b;
    }
}

contract Q85 {
    /*
        숫자 변수 2개를 구현하세요.
        한개는 찬성표 나머지 하나는 반대표의 숫자를 나타내는 변수입니다.
        찬성, 반대 투표는 배포된 후 20개 블록동안만 진행할 수 있게 해주세요.
    */

    uint public a;
    uint public b;
    uint public startBlock;
    uint public endBlock;

    constructor() {
        startBlock = block.number;
        endBlock = startBlock + 20; 
        
    }

    modifier chk{

        require(block.number >= startBlock && block.number <= endBlock, "end");
        _;
    }

    function ok() public {
        
        a ++;
    }

    function no() public {
        
        b ++;
    }
}

contract Q86 {
    /*
        숫자 변수 2개를 구현하세요.
        한개는 찬성표 나머지 하나는 반대표의 숫자를 나타내는 변수입니다.
        찬성, 반대 투표는 1이더 이상 deposit한 사람만 할 수 있게 제한을 걸어주세요.
    */

    uint public a;
    uint public b;

    mapping(address => uint) balance;

    modifier chk{

        require(balance[msg.sender] >= 1 ether, "end");
        _;
    }

    function deposit() public payable {
        require(msg.value > 0, "deposit ether");

        balance[msg.sender] += msg.value;
    }

    function ok() public {
        
        a ++;
    }

    function no() public {
        
        b ++;
    }
}

contract Q87 {
    /*
        visibility에 신경써서 구현하세요. 
        숫자 변수 a를 선언하세요.
        해당 변수는 컨트랙트 외부에서는 볼 수 없게 구현하세요.
        변화시키는 것도 오직 내부에서만 할 수 있게 해주세요. 
    */

    uint private a;
}

contract OWNER {
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    function setInternal(address _a) internal {
        owner = _a;
    }

    function getOwner() public view returns(address) {
        return owner;
    }
}

contract Q88 is OWNER{
    /*
        아래의 코드를 보고 owner를 변경시키는 방법을 생각하여 구현하세요.

        contract OWNER {
            address private owner;

            constructor() {
                owner = msg.sender;
            }

            function setInternal(address _a) internal {
                owner = _a;
            }

            function getOwner() public view returns(address) {
                return owner;
            }
        }

        힌트 : 상속
    */

    function changeOwner(address newOwner) public {

        setInternal(newOwner);
    }
}

contract Q89{
    /*
        이름과 자기 소개를 담은 고객이라는 구조체를 만드세요.
        이름은 5자에서 10자이내 자기 소개는 20자에서 50자 이내로 설정하세요.
        (띄어쓰기 포함 여부는 신경쓰지 않아도 됩니다. 더 쉬운 쪽으로 구현하세요.)
    */

    struct Customer{
        string name;
        string intro;
    }

    Customer public customer;

    function setCustomer(string memory _name, string memory _intro) public  {
        require(bytes(_name).length >= 5 && bytes(_name).length <= 10, "5~10");
        require(bytes(_intro).length >= 20 && bytes(_intro).length <= 50, "20 ~ 50");
        
        customer = Customer(_name, _intro);
    }
}

contract Q90 {
    /*
        당신 지갑의 이름을 알려주세요.
        아스키 코드를 이용하여 byte를 string으로 바꿔주세요.
    */

    
}