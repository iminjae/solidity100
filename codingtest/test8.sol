// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 < 0.9.0;

contract TEST8 {
    /*
        안건을 올리고 이에 대한 찬성과 반대를 할 수 있는 기능을 구현하세요. 
        안건은 번호, 제목, 내용, 제안자(address) 그리고 찬성자 수와 반대자 수로 이루어져 있습니다.(구조체)
        안건들을 모아놓은 자료구조도 구현하세요. 

        사용자는 자신의 이름과 주소, 자신이 만든 안건 그리고 자신이 투표한 안건과 어떻게 투표했는지(찬/반)에 대한 정보[string => bool]로 이루어져 있습니다.(구조체)

        * 사용자 등록 기능 - 사용자를 등록하는 기능
        * 투표하는 기능 - 특정 안건에 대하여 투표하는 기능, 안건은 제목으로 검색, 이미 투표한 건에 대해서는 재투표 불가능
        * 안건 제안 기능 - 자신이 원하는 안건을 제안하는 기능
        * 제안한 안건 확인 기능 - 자신이 제안한 안건에 대한 현재 진행 상황 확인기능 - (번호, 제목, 내용, 찬반 반환 // 밑의 심화 문제 풀었다면 상태도 반환)
        * 전체 안건 확인 기능 - 제목으로 안건을 검색하면 번호, 제목, 내용, 제안자, 찬반 수 모두를 반환하는 기능
        -------------------------------------------------------------------------------------------------
        * 안건 진행 과정 - 투표 진행중, 통과, 기각 상태를 구별하여 알려주고 15개 블록 후에 전체의 70%가 투표에 참여하고 투표자의 66% 이상이 찬성해야 통과로 변경, 둘 중 하나라도 만족못하면 기각
    */

    struct Angeon {
        uint number;
        string title;
        string content;
        address offer;
        uint agreeCnt;
        uint disagreeCnt;
    }

    struct User{
        string name;
        address adres;
        string madeAngeon;
        mapping(string => bool) vote;
    }

    uint public nextAngeonNumber = 1;
    mapping(string => Angeon) angeons;
    mapping(address => User) users;

    //사용자 등록 기능 - 사용자를 등록하는 기능
    function addUser(string memory _name) public {
        users[msg.sender].name = _name;
        users[msg.sender].adres = msg.sender;
    }

    //투표하는 기능 - 특정 안건에 대하여 투표하는 기능, 안건은 제목으로 검색, 이미 투표한 건에 대해서는 재투표 불가능
    function vote(string memory _title, bool _vote) public {

        // require(users[msg.sender].vote[_title]  ); 여기부터
        
        if(_vote){
            angeons[_title].agreeCnt ++;
        }else{
            angeons[_title].disagreeCnt ++;
        }

        users[msg.sender].vote[_title] = _vote;
    }

    //안건 제안 기능 - 자신이 원하는 안건을 제안하는 기능
    function createAngeon(string memory _title, string memory _content) public {
        
        Angeon storage newAngeun = angeons[_title];
        newAngeun.number = nextAngeonNumber;
        newAngeun.title = _title;
        newAngeun.content = _content;
        newAngeun.offer = msg.sender;
        newAngeun.agreeCnt = 0;
        newAngeun.disagreeCnt = 0;

        angeons[_title] = newAngeun;
        users[msg.sender].madeAngeon = _title;
        
        nextAngeonNumber ++;
    }


    //제안한 안건 확인 기능 - 자신이 제안한 안건에 대한 현재 진행 상황 확인기능 - (번호, 제목, 내용, 찬반 반환 // 밑의 심화 문제 풀었다면 상태도 반환)
    function checkAngeon() public view returns(Angeon memory) {
        
        return angeons[users[msg.sender].madeAngeon];
    }

}