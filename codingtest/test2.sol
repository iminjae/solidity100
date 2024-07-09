// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 < 0.9.0;

contract TEST2 {
    /*
        학생 점수관리 프로그램입니다.
        여러분은 한 학급을 맡았습니다.
        학생은 번호, 이름, 점수로 구성되어 있고(구조체)
        가장 점수가 낮은 사람을 집중관리하려고 합니다.

        * 가장 점수가 낮은 사람의 정보를 보여주는 기능,
        * 총 점수 합계, 총 점수 평균을 보여주는 기능,
        * 특정 학생을 반환하는 기능, -> 학생 정보
        ---------------------------------------------------
        * 가능하다면 학생 전체를 반환하는 기능을 구현하세요. ([] <- array)
    */

    struct Student{
        uint number;
        string name;
        uint score;
    }

    Student[] students;

    // function setStudnet(string memory _name, uint _score) public {

    //     students.push(Student(students.length + 1, _name, _score));
    // }

    

    //가장 점수가 낮은 사람의 정보를 보여주는 기능,
    function getLow() public view returns(Student memory) {

        Student memory lowStudent = students[0];

        for(uint i = 1; i < students.length; i++){
            if(students[i].score < lowStudent.score){
                //30     10 60 20 50 40
            
                lowStudent = students[i];

            }
        }


        return lowStudent;
    }



    //총 점수 합계
    function getSumScore() public view returns(uint) {
        
        uint sum;

        for(uint i = 0; i < students.length; i++){
            sum += students[i].score;
        }

        return sum;

    }

    //총 점수 평균
    function getAvgScore() public view returns(uint) {
        
        uint sum = getSumScore();
        uint cnt = students.length;

        return sum / cnt;
    }

    //특정 학생을 반환하는 기능, -> 학생 정보
    function getStudent(uint _number) public view returns(Student memory) {
        
        for(uint i = 0; i < students.length; i++){
            if(students[i].number == _number){
                return students[i];
            }
        }
        revert("not found");
    }

    //가능하다면 학생 전체를 반환하는 기능을 구현하세요. ([] <- array)
    function getAll() public view returns(Student[] memory) {
        return students;
    }

}