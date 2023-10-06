//
//  main.swift
//  926
//
//  Created by 김혜란 on 2023/09/26.
//

import Foundation

//func printShape (start: Int, end: Int, shape: String) {
//    for _ in start...end {
//        print(shape, terminator: "")
//    }
//}
//
//for i in (1...5) {
//    printShape(start: i, end: 5, shape: " ")
//    printShape(start: 1, end: i, shape: "*")
//    printShape(start: 1, end: i, shape: "*")
//    print()
//}

//func printShape (start: Int, end: Int, shape: String) -> String {
//    var result: String = ""
//    for _ in start...end {
//        result += shape
//    }
//    return result
//}
//
////let sum = printShape(start: 1, end: 5, shape: "*"), terminator: "")
////print(sum)
//
//for i in (1...5) {
//    //    printShape(start: i, end: 5, shape: " ")
//    //    printShape(start: 1, end: i, shape: "*")
//    //    printShape(start: 1, end: i, shape: "*")
//    //    print()
//
//    var str = ""
//    str += printShape(start: i, end: 5, shape: " ")
//    str += printShape(start: 1, end: i, shape: "*")
//    str += printShape(start: 1, end: i, shape: "*")
//    print(str)
//}



//3,6,9

//for cnt in 0..<100 {
//    let a = cnt / 10
//    let b = cnt % 10
//    print("\(a)\(b)", terminator: "")
//    }
//    if (a % 3 == 0) && (a != 0) {
//        print("*", terminator:"")
//    }
//    print()
//}


//예제1
//func sumNumber( num1: Int, num2: Int ){
//  print("연산결과 : \(num1 + num2) ")
//
//}
//
//print("1번째 수를 입력하세요: ", terminator:"")
//if let input1 = Int(readLine()!) {
//    print("2번째 수를 입력하세요: ", terminator:"")
//    if let input2 = Int(readLine()!) {
//        sumNumber(num1: input1, num2: input2)
//    } else {
//        print("올바른 숫자를 입력하지 않았습니다.")
//    }
//}
//
//
//
//
////예제2
//func findLargerNumber( num1: Int, num2: Int ){
//    if num1 > num2 {
//        print("큰 수 확인 : \(num1)")
//    } else if num1 == num2 {
//        print("0")
//    } else { print("큰 수 확인 : \(num2)") }
//}
//
//print("1번째 수를 입력하세요: ",terminator:"")
//if let input1 = Int(readLine()!) {
//    print("2번째 수를 입력하세요: ",terminator:"")
//    if let input2 = Int(readLine()!) {
//        findLargerNumber(num1: input1, num2: input2)
//    } else {
//        print("올바른 숫자를 입력하지 않았습니다.")
//    }
//}
//
//
/////예제3
//func closeTen( num1: Int, num2: Int ){
//    if 10-num1 > 10-num2 {
//        print("10에 가까운 수 : \(num2)")
//    } else if 10-num1 == 10-num2 {
//        print("0")
//    } else { print("10에 가까운 수 : \(num1)") }
//}
//
//print("1번째 수 : ", terminator:"")
//if let input1 = Int(readLine()!) {
//    print("2번째 수 : ", terminator:"")
//    if let input2 = Int(readLine()!) {
//        closeTen(num1: input1, num2: input2)
//    } else {
//        print("올바른 숫자를 입력하지 않았습니다.")
//    }
//}
//
//
////예제4
//func powerN( num1: Int, num2: Int ) -> Int {
//    var result = num1
//    for i in 1..<num2 {
//        result *= num1
//    }
//    return result
//}

//print("1번째 수 : ", terminator:"")
//if let input1 = Int(readLine()!) {
//    print("2번째 수 : ", terminator:"")
//    if let input2 = Int(readLine()!) {
//        let result = powerN(num1: input1, num2: input2)
//        print("결과 : ", result)
//    } else {
//        print("올바른 숫자를 입력하지 않았습니다.")
//    }
//}


//예제5
//func getAbsoluteValue( num1: Int, num2: Int) -> Int {
//    let abnum = num1 - num2
//    if abnum > 0 {
//        return abnum
//    }
//    else {
//        return -abnum
//    }
//}
//    print("1번째 수 : ", terminator:"")
//    if let input1 = Int(readLine()!) {
//        print("2번째 수 : ", terminator:"")
//        if let input2 = Int(readLine()!) {
//            let result = getAbsoluteValue(num1: input1, num2: input2)
//            print("절대 값 : ", result)
//        } else {
//            print("올바른 숫자를 입력하지 않았습니다.")
//        }
//    }


//예제8 - 약수 합 구하기
//func sumDivisors(of number: Int) -> Int {
//    var divisorsSum = 0
//
//    for i in 1...number {
//        if number % i == 0 {
//            divisorsSum += i
//        }
//    }
//    return divisorsSum
//}
//
//print("정수입력 : ")
//let num = Int(readLine()!)!
//let divisors = sumDivisors(of: num)
//
//print("\(num) 약수 합 : \(divisors)")

//예제9- - 완전수 출력
//약수를 구해서 더해본 다음에 그걸 인풋된 값이랑 비교하고 같으면 출력 아니면 널값
//
//func sumDivisors(of number: Int) -> Int {
//    var divisorsSum = 0
//
//    for i in 1...number {
//        if number % i == 0 {
//            divisorsSum += i
//        }
//    }
//    return divisorsSum
//}
//
//let num

//예제 10 - 소수 출력
//func isDivide(_ num1: Int, _ num2: Int) -> Bool {
//    return (num1 % num2 == 0)
//}
//
//func countOfDivisors ( a: Int ) -> Int {
//    var cnt = 0
//    for i  in 1...a {
//        if isDivide( a: a, b: i) {
//            cnt += 1
//        }
//    }
//    return cnt
//}
//
//let a: Int = 5
//let b: Int = 0
//
//for i in 2...30 {
//    let c: countOfDivisors(a:a)
//    if c == 2 {
//        print(i)
//    }
//}


//예제 1~3

//class studentInfo {
//        let name: String
//        let number: String
//        let age: Int
//        let scoreSwift: Int
//        let scoreIOS: Int
//        let scoreWeb: Int
//
//    init(name: String, number: String, age: Int, scoreSwift: Int, scoreIOS: Int, scoreWeb: Int) {
//        self.name = name
//        self.number = number
//        self.age = age
//        self.scoreSwift = scoreSwift
//        self.scoreIOS = scoreIOS
//        self.scoreWeb = scoreWeb
//    }
//
//    func showdent () {
//        print("""
//            \(name)님 안녕하세요.
//            [ \(number), \(age)살 ]
//            \(name)의 Swift 점수는 \(scoreSwift)점 입니다.
//            \(name)의 iOS 점수는 \(scoreIOS)점 입니다.
//            \(name)의 Web 점수는 \(scoreWeb)점 입니다.
//""")
//    }
//}
//
//let student1 = studentInfo(name: "홍길동", number: "20200677", age: 22, scoreSwift: 50, scoreIOS: 89, scoreWeb: 77)
//
//let student2 = studentInfo(name: "김영희", number: "20190541", age: 26, scoreSwift: 90, scoreIOS: 85, scoreWeb: 70)
//
//student1.showdent()
//print()
//student2.showdent()



//class TV {
//    var name = ""
//    var year = 0
//    var size = 0
//
//    init(name: String, year: Int, size: Int) {
//        self.name = name
//        self.year = year
//        self.size = size
//    }
//
//    func show() -> String {
//        return "\(name)에서 만든 \(year)년형 \(size)인치 TV"
//    }
//}
//
//let myTV = TV(name: "삼성", year: 2023, size: 72 )
//print(myTV.show())


////1-1
//var someInt: [Int] = []
//
////1-2,3
//for _ in 1...10 {
//    let random = Int.random(in: 1...10)
//    someInt.append(random)
//}
//
////1-6
//func sumArray (arr:[Int]) -> Int {
//    var total = 0
//    for i in someInt {
//        total += i
//    }
//    return total
//}
//
//func averArray (arr:[Int]) -> Double {
//    var aver = 0
//    for i in someInt {
//        aver += i
//    }
//    return Double(aver) / Double(arr.count)
//}
//
////1-4
//print(someInt)
//
////1-5
//print(someInt[4]+someInt[9])
//
////1-6
//let total = sumArray(arr: someInt)
//print(total)
//
////1-7
//let aver = averArray(arr: someInt)
//print(aver)
//
//func bubbleSort(_ array:[Int]) -> [Int] {
//    var sortedArray = array
//    let n = sortedArray.count
//    for i in 0..<n-1 {
//        for j in 0..<n-1-i {
//            print(i,j,j+1)
//            if sortedArray[j] > sortedArray[j+1] {
//                sortedArray.swapAt(j, j+1)
//            }
//        }
//    }
//    return sortedArray
//}
//
//
//print (bubbleSort([5,3,6,2,1]))


//
//func selsctionSort(_ array:[Int]) -> [Int] {
//    var sortedArray = array
//    let n = sortedArray.count
//    for i in 0..<n {
//        var minIndex = i
//        for j in i+1..<n {
//            if sortedArray[minIndex] > sortedArray[j] {
//                minIndex = j
//            }
//            print(i, j, sortedArray)
//        }
//        if i != minIndex {
//            sortedArray.swapAt(i, minIndex)
//        }
//    }
//    return sortedArray
//}
//
//print (selsctionSort([5,3,6,2,1]))


////
//func factorial(_ i: Int) -> Int {
//    print(i)
//    if i == 1 {
//        return 1
//    } else {
//        return i * factorial(i-1)
//    }
//}
//
//print("=>", factorial(3) )

//예제1
func listCount(_ list: [Int]) -> Int {
    if list.isEmpty {
        return 0
    } else {
        return 1 + listCount(Array(list.dropFirst()))
    }
}

let List = [1, 2, 3, 4, 5]
let result = listCount(List)
print("\(result)")


//예제2

